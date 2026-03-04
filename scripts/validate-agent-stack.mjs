#!/usr/bin/env node
import fs from "node:fs";
import path from "node:path";
import process from "node:process";

const root = process.cwd();
const requiredSkills = [
  "prototype-intake",
  "solution-architect",
  "ui-designer",
  "ui-dev",
  "api-dev",
  "qa-tester",
  "codex-orchestrator",
];

const requiredTopLevel = [
  "README.md",
  "docs/agents/skills-registry.yaml",
  "docs/agents/task-routing-matrix.md",
  "docs/agents/validation.md",
  "scripts/skills/setup-venv.sh",
  "scripts/skills/quick-validate.sh",
  "scripts/ci/full-gate.sh",
  "scripts/sync-codex-skills.sh",
  "scripts/testing/run-api-tests.sh",
  "scripts/testing/run-ui-tests.sh",
  "scripts/testing/validate-ui-coverage-map.sh",
  "skills/README.md",
];

function fail(message) {
  console.error(message);
  process.exitCode = 1;
}

for (const file of requiredTopLevel) {
  const full = path.join(root, file);
  if (!fs.existsSync(full)) {
    fail(`Missing required artifact: ${file}`);
  }
}

for (const skill of requiredSkills) {
  const base = path.join(root, "skills", skill);
  const required = [
    "SKILL.md",
    "agents/openai.yaml",
    "references/workflow.md",
    "references/handoff-contract.md",
  ];

  for (const rel of required) {
    const full = path.join(base, rel);
    if (!fs.existsSync(full)) {
      fail(`Missing skill artifact: skills/${skill}/${rel}`);
    }
  }
}

if (process.exitCode && process.exitCode !== 0) {
  process.exit(process.exitCode);
}

console.log("Agent stack validation passed");
