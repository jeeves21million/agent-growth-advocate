#!/usr/bin/env node
import fs from "node:fs";
import path from "node:path";
import process from "node:process";

const root = process.cwd();

const requiredSkills = [
  "rc-docs-api-ingestion",
  "rc-technical-content-engine",
  "rc-growth-experiment-lab",
  "rc-community-engagement-ops",
  "rc-product-feedback-analyst",
  "rc-weekly-metrics-reporter",
  "rc-application-pipeline",
  "rc-hiring-assessment-runner",
];

const requiredTopLevel = [
  "README.md",
  "skills/README.md",
  "docs/agents/skills-registry.yaml",
  "docs/agents/task-routing-matrix.md",
  "docs/agents/validation.md",
  "docs/hiring/job-requirements-matrix.md",
  "docs/hiring/weekly-operating-system.md",
  "docs/hiring/30-90-180-plan.md",
  "docs/hiring/README.md",
  "scripts/validate-agent-stack.mjs",
  "scripts/skills/quick-validate.sh",
  "scripts/ci/full-gate.sh",
  "scripts/sync-codex-skills.sh",
  "scripts/testing/run-api-tests.sh",
  "scripts/testing/run-ui-tests.sh",
  "scripts/testing/validate-ui-coverage-map.sh",
];

const requiredSkillArtifacts = [
  "SKILL.md",
  "agents/openai.yaml",
  "references/workflow.md",
  "references/handoff-contract.md",
];

let hasFailure = false;

function fail(message) {
  hasFailure = true;
  console.error(message);
}

for (const file of requiredTopLevel) {
  const full = path.join(root, file);
  if (!fs.existsSync(full)) {
    fail(`Missing required artifact: ${file}`);
  }
}

for (const skill of requiredSkills) {
  const base = path.join(root, "skills", skill);
  if (!fs.existsSync(base) || !fs.statSync(base).isDirectory()) {
    fail(`Missing required skill directory: skills/${skill}`);
    continue;
  }

  for (const rel of requiredSkillArtifacts) {
    const full = path.join(base, rel);
    if (!fs.existsSync(full)) {
      fail(`Missing skill artifact: skills/${skill}/${rel}`);
      continue;
    }

    if (fs.statSync(full).size === 0) {
      fail(`Empty skill artifact: skills/${skill}/${rel}`);
    }
  }
}

const skillsDir = path.join(root, "skills");
if (fs.existsSync(skillsDir) && fs.statSync(skillsDir).isDirectory()) {
  const localSkillDirs = fs
    .readdirSync(skillsDir, { withFileTypes: true })
    .filter((entry) => entry.isDirectory())
    .map((entry) => entry.name)
    .sort();

  const unexpected = localSkillDirs.filter((name) => !requiredSkills.includes(name));
  if (unexpected.length) {
    fail(`Unexpected skill directories present: ${unexpected.join(", ")}`);
  }
}

if (hasFailure) {
  process.exit(1);
}

console.log("Agent stack validation passed");
