---
name: Sudo and system file edits
description: User prefers scripts for system file changes rather than direct sudo tool calls. Askpass is configured.
type: feedback
---

Don't run sudo commands directly via the Bash tool — write a script to /tmp and let the user execute it, or give them the command to paste.

**Why:** User denied a sudo tee tool call. They prefer to review and run system-level changes themselves.

**How to apply:** For anything touching /usr, /etc, or requiring root, write a script or provide the command. Askpass is set up at /usr/local/bin/sudo-askpass if needed.
