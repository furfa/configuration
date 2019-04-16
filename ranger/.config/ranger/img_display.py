import subprocess
import json
import atexit
import socket
from pathlib import Path

import logging
from logging import info
import traceback

class MPVImageDisplayer(ImageDisplayer):
    """Implementation of ImageDisplayer using mpv, a general media viewer.
    Opens media in a separate X window.

    mpv 0.25+ needs to be installed for this to work.
    """

    def _send_command(self, path, sock):

        message = '{"command": ["raw","loadfile",%s]}\n' % json.dumps(path)
        s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        s.connect(str(sock))
        info('-> ' + message)
        s.send(message.encode())
        message = s.recv(1024).decode()
        info('<- ' + message)

    def _launch_mpv(self, path, sock):

        proc = Popen([
            * os.environ.get("MPV", "mpv").split(),
            "--no-terminal",
            "--force-window",
            "--input-ipc-server=" + str(sock),
            "--image-display-duration=inf",
            "--loop-file=inf",
            "--no-osc",
            "--no-input-default-bindings",
            "--keep-open",
            "--idle",
            "--",
            path,
        ])

        @atexit.register
        def cleanup():
            proc.terminate()
            sock.unlink()

    def draw(self, path, start_x, start_y, width, height):

        path = os.path.abspath(path)
        cache = Path(os.environ.get("XDG_CACHE_HOME", "~/.cache")).expanduser()
        cache = cache / "ranger"
        cache.mkdir(exist_ok=True)
        sock = cache / "image-slave.sock"

        try:
            self._send_command(path, sock)
        except (ConnectionRefusedError, FileNotFoundError):
            info('LAUNCHING ' + path)
            self._launch_mpv(path, sock)
        except Exception as e:
            logging.exception(traceback.format_exc())
            sys.exit(1)
        info('SUCCESS')
