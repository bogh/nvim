// Desktop notification when Pi finishes and is ready for input.

import { basename } from "node:path";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  let failed = false;

  pi.on("agent_start", () => {
    failed = false;
  });

  pi.on("message_end", (event) => {
    if (event.message.role === "assistant" && event.message.stopReason === "error") {
      failed = true;
    }
  });

  pi.on("agent_settled", async (_event, ctx) => {
    const project = basename(ctx.cwd) || ctx.cwd;
    const body = failed ? `${project}: stopped with an error` : `${project}: ready for input`;
    const result = await pi.exec("notify-send", ["Pi", body]);

    // OSC 777 is supported by Ghostty, iTerm2, WezTerm, and rxvt-unicode.
    if (result.code !== 0) {
      process.stdout.write(`\u001b]777;notify;Pi;${body}\u0007`);
    }
  });
}
