const fs = require("node:fs");

const logMessage = "Node.js cron job executed successfully at " + new Date().toISOString() + "\n";

fs.appendFileSync("/home/vishal/cron-test.txt", logMessage, { encoding: "utf-8" });
console.log("Log updated successfully!");