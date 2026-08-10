// Worktrunk activity tracking for Pi.
// Shows 🤖 while the agent is working and 💬 while it is waiting for input.

import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  const setMarker = async (marker: string) => {
    await pi.exec("wt", ["config", "state", "marker", "set", marker]);
  };

  const clearMarker = async () => {
    await pi.exec("wt", ["config", "state", "marker", "clear"]);
  };

  pi.on("session_start", async () => {
    await setMarker("💬");
  });

  pi.on("agent_start", async () => {
    await setMarker("🤖");
  });

  pi.on("agent_settled", async () => {
    await setMarker("💬");
  });

  pi.on("session_shutdown", clearMarker);
}
