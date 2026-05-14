# Active Council Bughunt Candidate Report

This report is not a pass/fail proof. It is a fresh queue of suspicious shapes
that sit outside, or at the edge of, the current closed sweep gates. A green
all-phases council run means registered gates passed; it does not mean these
candidate lines are bugs or that no bugs exist.

Classification rule: any accepted row must be ledgered, fixed with behavior
coverage, sibling-swept, and promoted into a durable gate before closure.

## Async void boundaries

## Silent catch or lossy exception boundaries

## Callback/event invocation boundaries

## Remote/user text in diagnostics or HTTP errors

## Red-team abuse lens
tests/test_porting_workspace.py:6:from pathlib import Path
tests/test_porting_workspace.py:29:            [sys.executable, '-m', 'src.main', 'summary'],
tests/test_porting_workspace.py:38:            [sys.executable, '-m', 'src.main', 'parity-audit'],
tests/test_porting_workspace.py:59:            [sys.executable, '-m', 'src.main', 'commands', '--limit', '5', '--query', 'review'],
tests/test_porting_workspace.py:65:            [sys.executable, '-m', 'src.main', 'tools', '--limit', '5', '--query', 'MCP'],
tests/test_porting_workspace.py:83:            [sys.executable, '-m', 'src.main', 'route', 'review MCP tool', '--limit', '5'],
tests/test_porting_workspace.py:89:            [sys.executable, '-m', 'src.main', 'show-command', 'review'],
tests/test_porting_workspace.py:95:            [sys.executable, '-m', 'src.main', 'show-tool', 'MCPTool'],
tests/test_porting_workspace.py:106:            [sys.executable, '-m', 'src.main', 'bootstrap', 'review MCP tool', '--limit', '5'],
tests/test_porting_workspace.py:115:    def test_bootstrap_session_tracks_turn_state(self) -> None:
tests/test_porting_workspace.py:118:        session = PortRuntime().bootstrap_session('review MCP tool', limit=5)
tests/test_porting_workspace.py:119:        self.assertGreaterEqual(len(session.turn_result.matched_tools), 1)
tests/test_porting_workspace.py:120:        self.assertIn('Prompt:', session.turn_result.output)
tests/test_porting_workspace.py:121:        self.assertGreaterEqual(session.turn_result.usage.input_tokens, 1)
tests/test_porting_workspace.py:123:    def test_exec_command_and_tool_cli_run(self) -> None:
tests/test_porting_workspace.py:125:            [sys.executable, '-m', 'src.main', 'exec-command', 'review', 'inspect security review'],
tests/test_porting_workspace.py:131:            [sys.executable, '-m', 'src.main', 'exec-tool', 'MCPTool', 'fetch resource list'],
tests/test_porting_workspace.py:141:            [sys.executable, '-m', 'src.main', 'setup-report'],
tests/test_porting_workspace.py:147:            [sys.executable, '-m', 'src.main', 'commands', '--limit', '5', '--no-plugin-commands'],
tests/test_porting_workspace.py:153:            [sys.executable, '-m', 'src.main', 'tools', '--limit', '5', '--simple-mode', '--no-mcp'],
tests/test_porting_workspace.py:162:    def test_load_session_cli_runs(self) -> None:
tests/test_porting_workspace.py:165:        session = PortRuntime().bootstrap_session('review MCP tool', limit=5)
tests/test_porting_workspace.py:166:        session_id = Path(session.persisted_session_path).stem
tests/test_porting_workspace.py:168:            [sys.executable, '-m', 'src.main', 'load-session', session_id],
tests/test_porting_workspace.py:173:        self.assertIn(session_id, result.stdout)
tests/test_porting_workspace.py:178:            [sys.executable, '-m', 'src.main', 'tools', '--limit', '10', '--deny-prefix', 'mcp'],
tests/test_porting_workspace.py:188:            [sys.executable, '-m', 'src.main', 'turn-loop', 'review MCP tool', '--max-turns', '2', '--structured-output'],
tests/test_porting_workspace.py:197:        remote_result = subprocess.run([sys.executable, '-m', 'src.main', 'remote-mode', 'workspace'], check=True, capture_output=True, text=True)
tests/test_porting_workspace.py:198:        ssh_result = subprocess.run([sys.executable, '-m', 'src.main', 'ssh-mode', 'workspace'], check=True, capture_output=True, text=True)
tests/test_porting_workspace.py:199:        teleport_result = subprocess.run([sys.executable, '-m', 'src.main', 'teleport-mode', 'workspace'], check=True, capture_output=True, text=True)
tests/test_porting_workspace.py:206:            [sys.executable, '-m', 'src.main', 'flush-transcript', 'review MCP tool'],
tests/test_porting_workspace.py:214:        command_graph = subprocess.run([sys.executable, '-m', 'src.main', 'command-graph'], check=True, capture_output=True, text=True)
tests/test_porting_workspace.py:215:        tool_pool = subprocess.run([sys.executable, '-m', 'src.main', 'tool-pool'], check=True, capture_output=True, text=True)
tests/test_porting_workspace.py:221:            [sys.executable, '-m', 'src.main', 'setup-report'],
tests/test_porting_workspace.py:229:    def test_execution_registry_runs(self) -> None:
tests/test_porting_workspace.py:230:        from src.execution_registry import build_execution_registry
tests/test_porting_workspace.py:232:        registry = build_execution_registry()
tests/test_porting_workspace.py:235:        self.assertIn('Mirrored command', registry.command('review').execute('review security'))
tests/test_porting_workspace.py:236:        self.assertIn('Mirrored tool', registry.tool('MCPTool').execute('fetch mcp resources'))
tests/test_porting_workspace.py:239:        graph_result = subprocess.run([sys.executable, '-m', 'src.main', 'bootstrap-graph'], check=True, capture_output=True, text=True)
tests/test_porting_workspace.py:240:        direct_result = subprocess.run([sys.executable, '-m', 'src.main', 'direct-connect-mode', 'workspace'], check=True, capture_output=True, text=True)
tests/test_porting_workspace.py:241:        deep_link_result = subprocess.run([sys.executable, '-m', 'src.main', 'deep-link-mode', 'workspace'], check=True, capture_output=True, text=True)
docs/dev/bug-council-active-backlog.md:34:| `Red-team abuse lens` | 0 | Open | Required recurring attacker-view review across secrets, identity, redirects, paths, process launch, and downgrade risks. | Turn accepted hypotheses into behavior tests plus remediation anchors; add preservation tests for normal functionality. |
docs/dev/bug-council-scan-registry.md:39:| Untrusted-string-to-path | Find file-system operations on caller-supplied strings without containment. |
docs/dev/bug-council-scan-registry.md:40:| Security-sensitive material | Find high-confidence private keys and token patterns. |
docs/dev/bug-council-scan-registry.md:41:| Red-team abuse lens | Re-check accepted fixes from an attacker viewpoint: spoofed identity, secret disclosure, confused deputy, replay, SSRF/path/process escape, and operational downgrade. |
scripts/run-council-active-bughunt.sh:25:    rg -n -U --with-filename --pcre2 --hidden --glob '!.git/**' --glob '!.council/**' "$pattern" "$@" || true
scripts/run-council-active-bughunt.sh:41:# Replace paths and patterns for your repo. Add narrow sections whenever a
scripts/run-council-active-bughunt.sh:61:  '(log|logger|Diagnostic|Console\.WriteLine|StatusCode\(|BadRequest\()[^;\n]*(username|query|filename|directory|token|message)' \
scripts/run-council-active-bughunt.sh:66:  '(token|secret|password|authorization|cookie|api[-_]?key|session|redirect|proxy|forwarded|path|filename|exec|spawn|shell|http://|https://)' \
scripts/check-bug-council-all-phases.sh:26:  printf 'Council all-phases runner is missing or not executable: %s\n' "${runner#$repo_root/}" >&2
docs/dev/bug-council-negative-space.md:19:| _replace_with_your_boundary_ | _network input_ | `src/path/to/sink.ext` | `ValidateInputName` |
scripts/check-council-sweep-counts.sh:82:#   "secret-pattern sweep count matches scanner"
scripts/check-council-negative-space.sh:65:#   "src/path/to/sink.ext" \
scripts/scan-bug-council-candidates.sh:24:  rg -n --with-filename --pcre2 --hidden --glob '!.git/**' "$pattern" "$@" || true
scripts/scan-bug-council-candidates.sh:33:  'PRIVATE KEY|gh[pousr]_[A-Za-z0-9_]{36,}|xox[baprs]-[A-Za-z0-9-]{20,}|AKIA[0-9A-Z]{16}|(?i)(api[_-]?key|access[_-]?token|client[_-]?secret)' \
scripts/scan-bug-council-candidates.sh:57:#   'tokio::spawn|select!|timeout\(|sleep\(|interval\(|mpsc|broadcast|oneshot' \
docs/dev/bug-council-severity-schema.md:12:| Low | Defensive-depth gap: code path is currently unreachable from untrusted input, but the absence of the guard is itself a hazard if a refactor exposes it. |
docs/dev/bug-council-severity-schema.md:15:Pick the **worst plausible** severity given current code paths. If the same code is reachable from two boundaries with different severities, take the higher.
scripts/check-local-identity-leaks.sh:17:tmp_tokens="$(mktemp)"
scripts/check-local-identity-leaks.sh:20:trap 'rm -f "$tmp_tokens" "$tmp_commits" "$tmp_files"' EXIT
scripts/check-local-identity-leaks.sh:22:add_token() {
scripts/check-local-identity-leaks.sh:23:  local token="$1"
scripts/check-local-identity-leaks.sh:24:  token="${token//$'\n'/}"
scripts/check-local-identity-leaks.sh:25:  token="${token//$'\r'/}"
scripts/check-local-identity-leaks.sh:26:  [[ ${#token} -ge 3 ]] || return 0
scripts/check-local-identity-leaks.sh:27:  case "$token" in
scripts/check-local-identity-leaks.sh:32:  printf '%s\n' "$token" >>"$tmp_tokens"
scripts/check-local-identity-leaks.sh:35:add_token "${LOCAL_IDENTITY_DENYLIST:-}"
scripts/check-local-identity-leaks.sh:36:add_token "${SLSKDN_LOCAL_IDENTITY_DENYLIST:-}"
scripts/check-local-identity-leaks.sh:37:add_token "${SLSKDN_FORBIDDEN_LOCAL_HOSTNAME:-}"
scripts/check-local-identity-leaks.sh:38:add_token "$(hostname -s 2>/dev/null || true)"
scripts/check-local-identity-leaks.sh:39:add_token "${USER:-}"
scripts/check-local-identity-leaks.sh:40:add_token "$(id -un 2>/dev/null || true)"
scripts/check-local-identity-leaks.sh:41:add_token "$(basename "${HOME:-}" 2>/dev/null || true)"
scripts/check-local-identity-leaks.sh:43:read_csv_tokens() {
scripts/check-local-identity-leaks.sh:46:  IFS=',' read -ra tokens <<<"$value"
scripts/check-local-identity-leaks.sh:47:  for token in "${tokens[@]}"; do
scripts/check-local-identity-leaks.sh:48:    add_token "$token"
scripts/check-local-identity-leaks.sh:52:read_csv_tokens "${LOCAL_IDENTITY_DENYLIST:-}"
scripts/check-local-identity-leaks.sh:53:read_csv_tokens "${SLSKDN_LOCAL_IDENTITY_DENYLIST:-}"
scripts/check-local-identity-leaks.sh:58:  while IFS= read -r token; do
scripts/check-local-identity-leaks.sh:59:    [[ "$token" =~ ^[[:space:]]*# ]] && continue
scripts/check-local-identity-leaks.sh:60:    add_token "$token"
scripts/check-local-identity-leaks.sh:67:sort -u "$tmp_tokens" -o "$tmp_tokens"
scripts/check-local-identity-leaks.sh:68:if [[ ! -s "$tmp_tokens" ]]; then
scripts/check-local-identity-leaks.sh:69:  echo "No local identity tokens configured for scanning."
scripts/check-local-identity-leaks.sh:77:  local path="$2"
scripts/check-local-identity-leaks.sh:78:  local display_path="${3:-$path}"
scripts/check-local-identity-leaks.sh:81:  [[ -f "$path" ]] || return 0
scripts/check-local-identity-leaks.sh:83:    rg --json --fixed-strings --ignore-case --file "$tmp_tokens" "$path" |
scripts/check-local-identity-leaks.sh:84:      jq -r --arg label "$label" --arg display_path "$display_path" 'select(.type == "match") | "\($label): \($display_path):\(.data.line_number)"' |
scripts/check-local-identity-leaks.sh:96:  trap 'rm -f "$tmp_tokens" "$tmp_commits" "$tmp_files" "$tmp_unreleased"' EXIT
scripts/check-local-identity-leaks.sh:117:  -path './.git' -prune -o \
scripts/check-local-identity-leaks.sh:118:  -path './node_modules' -prune -o \
scripts/check-local-identity-leaks.sh:119:  -path './vendor' -prune -o \
scripts/check-local-identity-leaks.sh:120:  -path './target' -prune -o \
scripts/check-local-identity-leaks.sh:121:  -path './dist' -prune -o \
scripts/check-local-identity-leaks.sh:122:  -path './build' -prune -o \
scripts/check-local-identity-leaks.sh:123:  -path './zeek/pkg' -prune -o \
scripts/check-local-identity-leaks.sh:125:    -path './.github/release-notes/*' -o \
scripts/check-local-identity-leaks.sh:126:    -path './docs/dev/release-copy.md' -o \
scripts/check-local-identity-leaks.sh:127:    -path './docs/release*.md' -o \
scripts/check-local-identity-leaks.sh:128:    -path './docs/RELEASE*.md' -o \
scripts/check-local-identity-leaks.sh:129:    -path './packaging/winget/*' \
scripts/check-local-identity-leaks.sh:132:while IFS= read -r path; do
scripts/check-local-identity-leaks.sh:133:  [[ -n "$path" ]] || continue
scripts/check-local-identity-leaks.sh:134:  check_file "$path" "$path"
docs/dev/bug-council-phases.md:8:| 2 | Semantic analyzer beachhead | _Pending / In progress / Done_ | _agent_ | One language-appropriate semantic analyzer (Roslyn / Clippy / ESLint) implementing a taint-to-allocation or taint-to-path lens, with tests. |
docs/dev/bug-council-phases.md:16:| 10 | Additional semantic lens batch | _Pending / In progress / Done_ | _agent_ | Add several distinct semantic lenses in one batch, such as tainted protocol offsets, paths, timeouts, endpoints, enum/status conversions, slice bounds, diagnostic/log-line text, outbound messages, cache keys, crypto trust material, dynamic execution, parser runtimes, resource capacities, and buffer operations, with unit tests and calibration. |
src/_archive_helper.py:6:from pathlib import Path
src/_archive_helper.py:11:    snapshot_path = (
src/_archive_helper.py:17:    return json.loads(snapshot_path.read_text())
scripts/check-remediation-baseline.sh:24:  local path="$1"
scripts/check-remediation-baseline.sh:27:  if [[ -f "$path" ]]; then
scripts/check-remediation-baseline.sh:30:    fail "$label: missing $path"
scripts/check-remediation-baseline.sh:36:  local path="$2"
scripts/check-remediation-baseline.sh:39:  if rg -n -U --pcre2 --hidden --glob '!.git/**' "$pattern" "$path" >/dev/null; then
scripts/check-remediation-baseline.sh:48:  local path="$2"
scripts/check-remediation-baseline.sh:54:  if rg -n -U --pcre2 --hidden --glob '!.git/**' "$pattern" "$path" >"$hit_file" 2>/dev/null; then
scripts/check-remediation-baseline.sh:109:# require_pattern "ValidateInputName" "src/path/to/sink" "input validator wired"
scripts/check-remediation-baseline.sh:110:# require_pattern "MaxRequestSize" "src/path/to/limit" "request size bound declared"
scripts/check-remediation-baseline.sh:113:secret_pattern='-----BEGIN (RSA |DSA |EC |OPENSSH |PGP )?PRIVATE KEY-----|gh[pousr]_[A-Za-z0-9_]{36,}|xox[baprs]-[A-Za-z0-9-]{20,}|AKIA[0-9A-Z]{16}|(?i)(api[_-]?key|access[_-]?token|client[_-]?secret)["'\'']?\s*[:=]\s*["'\''][A-Za-z0-9_./+=-]{24,}["'\'']'
scripts/check-remediation-baseline.sh:114:require_absent_pattern "$secret_pattern" "." "tracked text files do not contain high-confidence secret patterns"
docs/dev/bug-council-roslyn-analyzers.md:23:| CSL0004 | TaintToFilePath | High | Network-derived file/directory path without sanctioned containment validation. This catches hostile paths before filesystem sinks trust them. |
src/__init__.py:8:from .session_store import StoredSession, load_session, save_session
src/__init__.py:26:    'load_session',
src/__init__.py:28:    'save_session',
src/models.py:9:    path: str
src/models.py:30:    input_tokens: int = 0
src/models.py:31:    output_tokens: int = 0
src/models.py:35:            input_tokens=self.input_tokens + len(prompt.split()),
src/models.py:36:            output_tokens=self.output_tokens + len(output.split()),
src/execution_registry.py:5:from .commands import PORTED_COMMANDS, execute_command
src/execution_registry.py:6:from .tools import PORTED_TOOLS, execute_tool
src/execution_registry.py:14:    def execute(self, prompt: str) -> str:
src/execution_registry.py:15:        return execute_command(self.name, prompt).message
src/execution_registry.py:23:    def execute(self, payload: str) -> str:
src/execution_registry.py:24:        return execute_tool(self.name, payload).message
src/execution_registry.py:47:def build_execution_registry() -> ExecutionRegistry:
src/context.py:4:from pathlib import Path
src/context.py:30:        python_file_count=sum(1 for path in source_root.rglob('*.py') if path.is_file()),
src/context.py:31:        test_file_count=sum(1 for path in tests_root.rglob('*.py') if path.is_file()),
src/context.py:32:        asset_file_count=sum(1 for path in assets_root.rglob('*') if path.is_file()),
src/commands.py:6:from pathlib import Path
src/commands.py:75:def execute_command(name: str, prompt: str = '') -> CommandExecution:
src/prefetch.py:4:from pathlib import Path
src/prefetch.py:19:    return PrefetchResult('keychain_prefetch', True, 'Simulated keychain prefetch for trusted startup path')
src/parity_audit.py:5:from pathlib import Path
src/parity_audit.py:66:    'upstreamproxy': 'upstreamproxy',
src/parity_audit.py:117:def _snapshot_count(path: Path) -> int:
src/parity_audit.py:118:    return len(json.loads(path.read_text()))
src/parity_audit.py:122:    current_entries = {path.name for path in CURRENT_ROOT.iterdir()}
src/parity_audit.py:127:    current_python_files = sum(1 for path in CURRENT_ROOT.rglob('*.py') if path.is_file())
src/port_manifest.py:5:from pathlib import Path
src/port_manifest.py:32:    files = [path for path in root.rglob('*.py') if path.is_file()]
src/port_manifest.py:34:        path.relative_to(root).parts[0] if len(path.relative_to(root).parts) > 1 else path.name
src/port_manifest.py:35:        for path in files
src/port_manifest.py:36:        if path.name != '__pycache__'
src/port_manifest.py:49:        Subsystem(name=name, path=f'src/{name}', file_count=count, notes=notes.get(name, 'Python port support module'))
src/upstreamproxy/__init__.py:1:"""Python package placeholder for the archived `upstreamproxy` subsystem."""
src/upstreamproxy/__init__.py:7:_SNAPSHOT = load_archive_metadata("upstreamproxy")
src/deferred_init.py:12:    session_hooks: bool
src/deferred_init.py:19:            f'- session_hooks={self.session_hooks}',
src/deferred_init.py:30:        session_hooks=enabled,
src/runtime.py:13:from .execution_registry import build_execution_registry
src/runtime.py:34:    command_execution_messages: tuple[str, ...]
src/runtime.py:35:    tool_execution_messages: tuple[str, ...]
src/runtime.py:37:    persisted_session_path: str
src/runtime.py:71:            *(self.command_execution_messages or ('none',)),
src/runtime.py:74:            *(self.tool_execution_messages or ('none',)),
src/runtime.py:82:            f'Persisted session path: {self.persisted_session_path}',
src/runtime.py:91:        tokens = {token.lower() for token in prompt.replace('/', ' ').replace('-', ' ').split() if token}
src/runtime.py:93:            'command': self._collect_matches(tokens, PORTED_COMMANDS, 'command'),
src/runtime.py:94:            'tool': self._collect_matches(tokens, PORTED_TOOLS, 'tool'),
src/runtime.py:109:    def bootstrap_session(self, prompt: str, limit: int = 5) -> RuntimeSession:
src/runtime.py:118:        registry = build_execution_registry()
src/runtime.py:119:        command_execs = tuple(registry.command(match.name).execute(prompt) for match in matches if match.kind == 'command' and registry.command(match.name))
src/runtime.py:120:        tool_execs = tuple(registry.tool(match.name).execute(prompt) for match in matches if match.kind == 'tool' and registry.tool(match.name))
src/runtime.py:134:        persisted_session_path = engine.persist_session()
src/runtime.py:136:        history.add('execution', f'command_execs={len(command_execs)} tool_execs={len(tool_execs)}')
src/runtime.py:138:        history.add('session_store', persisted_session_path)
src/runtime.py:148:            command_execution_messages=command_execs,
src/runtime.py:149:            tool_execution_messages=tool_execs,
src/runtime.py:151:            persisted_session_path=persisted_session_path,
src/runtime.py:173:                denials.append(PermissionDenial(tool_name=match.name, reason='destructive shell execution remains gated in the Python port'))
src/runtime.py:176:    def _collect_matches(self, tokens: set[str], modules: tuple[PortingModule, ...], kind: str) -> list[RoutedMatch]:
src/runtime.py:179:            score = self._score(tokens, module)
src/runtime.py:186:    def _score(tokens: set[str], module: PortingModule) -> int:
src/runtime.py:189:        for token in tokens:
src/runtime.py:190:            if any(token in haystack for haystack in haystacks):
src/remote_runtime.py:21:    return RuntimeModeReport('ssh', True, f'SSH proxy placeholder prepared for {target}')
src/reference_data/archive_surface_snapshot.json:55:    "upstreamproxy",
src/main.py:7:from .commands import execute_command, get_command, get_commands, render_command_index
src/main.py:15:from .session_store import load_session
src/main.py:18:from .tools import execute_tool, get_tool, get_tools, render_tool_index
src/main.py:52:    bootstrap_parser = subparsers.add_parser('bootstrap', help='build a runtime-style session report from the mirrored inventories')
src/main.py:62:    flush_parser = subparsers.add_parser('flush-transcript', help='persist and flush a temporary session transcript')
src/main.py:65:    load_session_parser = subparsers.add_parser('load-session', help='load a previously persisted session')
src/main.py:66:    load_session_parser.add_argument('session_id')
src/main.py:84:    exec_command_parser = subparsers.add_parser('exec-command', help='execute a mirrored command shim by exact name')
src/main.py:85:    exec_command_parser.add_argument('name')
src/main.py:86:    exec_command_parser.add_argument('prompt')
src/main.py:88:    exec_tool_parser = subparsers.add_parser('exec-tool', help='execute a mirrored tool shim by exact name')
src/main.py:89:    exec_tool_parser.add_argument('name')
src/main.py:90:    exec_tool_parser.add_argument('payload')
src/main.py:151:        print(PortRuntime().bootstrap_session(args.prompt, limit=args.limit).as_markdown())
src/main.py:163:        path = engine.persist_session()
src/main.py:164:        print(path)
src/main.py:167:    if args.command == 'load-session':
src/main.py:168:        session = load_session(args.session_id)
src/main.py:169:        print(f'{session.session_id}\n{len(session.messages)} messages\nin={session.input_tokens} out={session.output_tokens}')
src/main.py:200:    if args.command == 'exec-command':
src/main.py:201:        result = execute_command(args.name, args.prompt)
src/main.py:204:    if args.command == 'exec-tool':
src/main.py:205:        result = execute_tool(args.name, args.payload)
src/query_engine.py:10:from .session_store import StoredSession, load_session, save_session
src/query_engine.py:18:    max_budget_tokens: int = 2000
src/query_engine.py:39:    session_id: str = field(default_factory=lambda: uuid4().hex)
src/query_engine.py:50:    def from_saved_session(cls, session_id: str) -> 'QueryEnginePort':
src/query_engine.py:51:        stored = load_session(session_id)
src/query_engine.py:55:            session_id=stored.session_id,
src/query_engine.py:57:            total_usage=UsageSummary(stored.input_tokens, stored.output_tokens),
src/query_engine.py:89:        if projected_usage.input_tokens + projected_usage.output_tokens > self.config.max_budget_tokens:
src/query_engine.py:113:        yield {'type': 'message_start', 'session_id': self.session_id, 'prompt': prompt}
src/query_engine.py:124:            'usage': {'input_tokens': result.usage.input_tokens, 'output_tokens': result.usage.output_tokens},
src/query_engine.py:140:    def persist_session(self) -> str:
src/query_engine.py:142:        path = save_session(
src/query_engine.py:144:                session_id=self.session_id,
src/query_engine.py:146:                input_tokens=self.total_usage.input_tokens,
src/query_engine.py:147:                output_tokens=self.total_usage.output_tokens,
src/query_engine.py:150:        return str(path)
src/query_engine.py:156:                'session_id': self.session_id,
src/query_engine.py:168:                payload = {'summary': ['structured output retry'], 'session_id': self.session_id}
src/query_engine.py:185:            f'Session id: {self.session_id}',
src/query_engine.py:188:            f'Usage totals: in={self.total_usage.input_tokens} out={self.total_usage.output_tokens}',
src/query_engine.py:190:            f'Max budget tokens: {self.config.max_budget_tokens}',
src/reference_data/commands_snapshot.json:5:    "responsibility": "Command module mirrored from archived TypeScript path commands/add-dir/add-dir.tsx"
src/reference_data/commands_snapshot.json:10:    "responsibility": "Command module mirrored from archived TypeScript path commands/add-dir/index.ts"
src/reference_data/commands_snapshot.json:15:    "responsibility": "Command module mirrored from archived TypeScript path commands/add-dir/validation.ts"
src/reference_data/commands_snapshot.json:20:    "responsibility": "Command module mirrored from archived TypeScript path commands/advisor.ts"
src/reference_data/commands_snapshot.json:25:    "responsibility": "Command module mirrored from archived TypeScript path commands/agents/agents.tsx"
src/reference_data/commands_snapshot.json:30:    "responsibility": "Command module mirrored from archived TypeScript path commands/agents/index.ts"
src/reference_data/commands_snapshot.json:35:    "responsibility": "Command module mirrored from archived TypeScript path commands/ant-trace/index.js"
src/reference_data/commands_snapshot.json:40:    "responsibility": "Command module mirrored from archived TypeScript path commands/autofix-pr/index.js"
src/reference_data/commands_snapshot.json:43:    "name": "backfill-sessions",
src/reference_data/commands_snapshot.json:44:    "source_hint": "commands/backfill-sessions/index.js",
src/reference_data/commands_snapshot.json:45:    "responsibility": "Command module mirrored from archived TypeScript path commands/backfill-sessions/index.js"
src/reference_data/commands_snapshot.json:50:    "responsibility": "Command module mirrored from archived TypeScript path commands/branch/branch.ts"
src/reference_data/commands_snapshot.json:55:    "responsibility": "Command module mirrored from archived TypeScript path commands/branch/index.ts"
src/reference_data/commands_snapshot.json:60:    "responsibility": "Command module mirrored from archived TypeScript path commands/break-cache/index.js"
src/reference_data/commands_snapshot.json:65:    "responsibility": "Command module mirrored from archived TypeScript path commands/bridge/bridge.tsx"
src/reference_data/commands_snapshot.json:70:    "responsibility": "Command module mirrored from archived TypeScript path commands/bridge/index.ts"
src/reference_data/commands_snapshot.json:75:    "responsibility": "Command module mirrored from archived TypeScript path commands/bridge-kick.ts"
src/reference_data/commands_snapshot.json:80:    "responsibility": "Command module mirrored from archived TypeScript path commands/brief.ts"
src/reference_data/commands_snapshot.json:85:    "responsibility": "Command module mirrored from archived TypeScript path commands/btw/btw.tsx"
src/reference_data/commands_snapshot.json:90:    "responsibility": "Command module mirrored from archived TypeScript path commands/btw/index.ts"
src/reference_data/commands_snapshot.json:95:    "responsibility": "Command module mirrored from archived TypeScript path commands/bughunter/index.js"
src/reference_data/commands_snapshot.json:100:    "responsibility": "Command module mirrored from archived TypeScript path commands/chrome/chrome.tsx"
src/reference_data/commands_snapshot.json:105:    "responsibility": "Command module mirrored from archived TypeScript path commands/chrome/index.ts"
src/reference_data/commands_snapshot.json:110:    "responsibility": "Command module mirrored from archived TypeScript path commands/clear/caches.ts"
src/reference_data/commands_snapshot.json:115:    "responsibility": "Command module mirrored from archived TypeScript path commands/clear/clear.ts"
src/reference_data/commands_snapshot.json:120:    "responsibility": "Command module mirrored from archived TypeScript path commands/clear/conversation.ts"
src/reference_data/commands_snapshot.json:125:    "responsibility": "Command module mirrored from archived TypeScript path commands/clear/index.ts"
src/reference_data/commands_snapshot.json:130:    "responsibility": "Command module mirrored from archived TypeScript path commands/color/color.ts"
src/reference_data/commands_snapshot.json:135:    "responsibility": "Command module mirrored from archived TypeScript path commands/color/index.ts"
src/reference_data/commands_snapshot.json:140:    "responsibility": "Command module mirrored from archived TypeScript path commands/commit-push-pr.ts"
src/reference_data/commands_snapshot.json:145:    "responsibility": "Command module mirrored from archived TypeScript path commands/commit.ts"
src/reference_data/commands_snapshot.json:150:    "responsibility": "Command module mirrored from archived TypeScript path commands/compact/compact.ts"
src/reference_data/commands_snapshot.json:155:    "responsibility": "Command module mirrored from archived TypeScript path commands/compact/index.ts"
src/reference_data/commands_snapshot.json:160:    "responsibility": "Command module mirrored from archived TypeScript path commands/config/config.tsx"
src/reference_data/commands_snapshot.json:165:    "responsibility": "Command module mirrored from archived TypeScript path commands/config/index.ts"
src/reference_data/commands_snapshot.json:170:    "responsibility": "Command module mirrored from archived TypeScript path commands/context/context-noninteractive.ts"
src/reference_data/commands_snapshot.json:175:    "responsibility": "Command module mirrored from archived TypeScript path commands/context/context.tsx"
src/reference_data/commands_snapshot.json:180:    "responsibility": "Command module mirrored from archived TypeScript path commands/context/index.ts"
src/reference_data/commands_snapshot.json:185:    "responsibility": "Command module mirrored from archived TypeScript path commands/copy/copy.tsx"
src/reference_data/commands_snapshot.json:190:    "responsibility": "Command module mirrored from archived TypeScript path commands/copy/index.ts"
src/reference_data/commands_snapshot.json:195:    "responsibility": "Command module mirrored from archived TypeScript path commands/cost/cost.ts"
src/reference_data/commands_snapshot.json:200:    "responsibility": "Command module mirrored from archived TypeScript path commands/cost/index.ts"
src/reference_data/commands_snapshot.json:205:    "responsibility": "Command module mirrored from archived TypeScript path commands/createMovedToPluginCommand.ts"
src/reference_data/commands_snapshot.json:210:    "responsibility": "Command module mirrored from archived TypeScript path commands/ctx_viz/index.js"
src/reference_data/commands_snapshot.json:215:    "responsibility": "Command module mirrored from archived TypeScript path commands/debug-tool-call/index.js"
src/reference_data/commands_snapshot.json:220:    "responsibility": "Command module mirrored from archived TypeScript path commands/desktop/desktop.tsx"
src/reference_data/commands_snapshot.json:225:    "responsibility": "Command module mirrored from archived TypeScript path commands/desktop/index.ts"
src/reference_data/commands_snapshot.json:230:    "responsibility": "Command module mirrored from archived TypeScript path commands/diff/diff.tsx"
src/reference_data/commands_snapshot.json:235:    "responsibility": "Command module mirrored from archived TypeScript path commands/diff/index.ts"
src/reference_data/commands_snapshot.json:240:    "responsibility": "Command module mirrored from archived TypeScript path commands/doctor/doctor.tsx"
src/reference_data/commands_snapshot.json:245:    "responsibility": "Command module mirrored from archived TypeScript path commands/doctor/index.ts"
src/reference_data/commands_snapshot.json:250:    "responsibility": "Command module mirrored from archived TypeScript path commands/effort/effort.tsx"
src/reference_data/commands_snapshot.json:255:    "responsibility": "Command module mirrored from archived TypeScript path commands/effort/index.ts"
src/reference_data/commands_snapshot.json:260:    "responsibility": "Command module mirrored from archived TypeScript path commands/env/index.js"
src/reference_data/commands_snapshot.json:265:    "responsibility": "Command module mirrored from archived TypeScript path commands/exit/exit.tsx"
src/reference_data/commands_snapshot.json:270:    "responsibility": "Command module mirrored from archived TypeScript path commands/exit/index.ts"
src/reference_data/commands_snapshot.json:275:    "responsibility": "Command module mirrored from archived TypeScript path commands/export/export.tsx"
src/reference_data/commands_snapshot.json:280:    "responsibility": "Command module mirrored from archived TypeScript path commands/export/index.ts"
src/reference_data/commands_snapshot.json:285:    "responsibility": "Command module mirrored from archived TypeScript path commands/extra-usage/extra-usage-core.ts"
src/reference_data/commands_snapshot.json:290:    "responsibility": "Command module mirrored from archived TypeScript path commands/extra-usage/extra-usage-noninteractive.ts"
src/reference_data/commands_snapshot.json:295:    "responsibility": "Command module mirrored from archived TypeScript path commands/extra-usage/extra-usage.tsx"
src/reference_data/commands_snapshot.json:300:    "responsibility": "Command module mirrored from archived TypeScript path commands/extra-usage/index.ts"
src/reference_data/commands_snapshot.json:305:    "responsibility": "Command module mirrored from archived TypeScript path commands/fast/fast.tsx"
src/reference_data/commands_snapshot.json:310:    "responsibility": "Command module mirrored from archived TypeScript path commands/fast/index.ts"
src/reference_data/commands_snapshot.json:315:    "responsibility": "Command module mirrored from archived TypeScript path commands/feedback/feedback.tsx"
src/reference_data/commands_snapshot.json:320:    "responsibility": "Command module mirrored from archived TypeScript path commands/feedback/index.ts"
src/reference_data/commands_snapshot.json:325:    "responsibility": "Command module mirrored from archived TypeScript path commands/files/files.ts"
src/reference_data/commands_snapshot.json:330:    "responsibility": "Command module mirrored from archived TypeScript path commands/files/index.ts"
src/reference_data/commands_snapshot.json:335:    "responsibility": "Command module mirrored from archived TypeScript path commands/good-claude/index.js"
src/reference_data/commands_snapshot.json:340:    "responsibility": "Command module mirrored from archived TypeScript path commands/heapdump/heapdump.ts"
src/reference_data/commands_snapshot.json:345:    "responsibility": "Command module mirrored from archived TypeScript path commands/heapdump/index.ts"
src/reference_data/commands_snapshot.json:350:    "responsibility": "Command module mirrored from archived TypeScript path commands/help/help.tsx"
src/reference_data/commands_snapshot.json:355:    "responsibility": "Command module mirrored from archived TypeScript path commands/help/index.ts"
src/reference_data/commands_snapshot.json:360:    "responsibility": "Command module mirrored from archived TypeScript path commands/hooks/hooks.tsx"
src/reference_data/commands_snapshot.json:365:    "responsibility": "Command module mirrored from archived TypeScript path commands/hooks/index.ts"
src/reference_data/commands_snapshot.json:370:    "responsibility": "Command module mirrored from archived TypeScript path commands/ide/ide.tsx"
src/reference_data/commands_snapshot.json:375:    "responsibility": "Command module mirrored from archived TypeScript path commands/ide/index.ts"
src/reference_data/commands_snapshot.json:380:    "responsibility": "Command module mirrored from archived TypeScript path commands/init-verifiers.ts"
src/reference_data/commands_snapshot.json:385:    "responsibility": "Command module mirrored from archived TypeScript path commands/init.ts"
src/reference_data/commands_snapshot.json:390:    "responsibility": "Command module mirrored from archived TypeScript path commands/insights.ts"
src/reference_data/commands_snapshot.json:395:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/ApiKeyStep.tsx"
src/reference_data/commands_snapshot.json:400:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/CheckExistingSecretStep.tsx"
src/reference_data/commands_snapshot.json:405:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/CheckGitHubStep.tsx"
src/reference_data/commands_snapshot.json:410:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/ChooseRepoStep.tsx"
src/reference_data/commands_snapshot.json:415:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/CreatingStep.tsx"
src/reference_data/commands_snapshot.json:420:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/ErrorStep.tsx"
src/reference_data/commands_snapshot.json:425:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/ExistingWorkflowStep.tsx"
src/reference_data/commands_snapshot.json:430:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/InstallAppStep.tsx"
src/reference_data/commands_snapshot.json:435:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/OAuthFlowStep.tsx"
src/reference_data/commands_snapshot.json:440:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/SuccessStep.tsx"
src/reference_data/commands_snapshot.json:445:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/WarningsStep.tsx"
src/reference_data/commands_snapshot.json:450:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/index.ts"
src/reference_data/commands_snapshot.json:455:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/install-github-app.tsx"
src/reference_data/commands_snapshot.json:460:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-github-app/setupGitHubActions.ts"
src/reference_data/commands_snapshot.json:465:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-slack-app/index.ts"
src/reference_data/commands_snapshot.json:470:    "responsibility": "Command module mirrored from archived TypeScript path commands/install-slack-app/install-slack-app.ts"
src/reference_data/commands_snapshot.json:475:    "responsibility": "Command module mirrored from archived TypeScript path commands/install.tsx"
src/reference_data/commands_snapshot.json:480:    "responsibility": "Command module mirrored from archived TypeScript path commands/issue/index.js"
src/reference_data/commands_snapshot.json:485:    "responsibility": "Command module mirrored from archived TypeScript path commands/keybindings/index.ts"
src/reference_data/commands_snapshot.json:490:    "responsibility": "Command module mirrored from archived TypeScript path commands/keybindings/keybindings.ts"
src/reference_data/commands_snapshot.json:495:    "responsibility": "Command module mirrored from archived TypeScript path commands/login/index.ts"
src/reference_data/commands_snapshot.json:500:    "responsibility": "Command module mirrored from archived TypeScript path commands/login/login.tsx"
src/reference_data/commands_snapshot.json:505:    "responsibility": "Command module mirrored from archived TypeScript path commands/logout/index.ts"
src/reference_data/commands_snapshot.json:510:    "responsibility": "Command module mirrored from archived TypeScript path commands/logout/logout.tsx"
src/reference_data/commands_snapshot.json:515:    "responsibility": "Command module mirrored from archived TypeScript path commands/mcp/addCommand.ts"
src/reference_data/commands_snapshot.json:520:    "responsibility": "Command module mirrored from archived TypeScript path commands/mcp/index.ts"
src/reference_data/commands_snapshot.json:525:    "responsibility": "Command module mirrored from archived TypeScript path commands/mcp/mcp.tsx"
src/reference_data/commands_snapshot.json:530:    "responsibility": "Command module mirrored from archived TypeScript path commands/mcp/xaaIdpCommand.ts"
src/reference_data/commands_snapshot.json:535:    "responsibility": "Command module mirrored from archived TypeScript path commands/memory/index.ts"
src/reference_data/commands_snapshot.json:540:    "responsibility": "Command module mirrored from archived TypeScript path commands/memory/memory.tsx"
src/reference_data/commands_snapshot.json:545:    "responsibility": "Command module mirrored from archived TypeScript path commands/mobile/index.ts"
src/reference_data/commands_snapshot.json:550:    "responsibility": "Command module mirrored from archived TypeScript path commands/mobile/mobile.tsx"
src/reference_data/commands_snapshot.json:555:    "responsibility": "Command module mirrored from archived TypeScript path commands/mock-limits/index.js"
src/reference_data/commands_snapshot.json:560:    "responsibility": "Command module mirrored from archived TypeScript path commands/model/index.ts"
src/reference_data/commands_snapshot.json:565:    "responsibility": "Command module mirrored from archived TypeScript path commands/model/model.tsx"
src/reference_data/commands_snapshot.json:570:    "responsibility": "Command module mirrored from archived TypeScript path commands/oauth-refresh/index.js"
src/reference_data/commands_snapshot.json:575:    "responsibility": "Command module mirrored from archived TypeScript path commands/onboarding/index.js"
src/reference_data/commands_snapshot.json:580:    "responsibility": "Command module mirrored from archived TypeScript path commands/output-style/index.ts"
src/reference_data/commands_snapshot.json:585:    "responsibility": "Command module mirrored from archived TypeScript path commands/output-style/output-style.tsx"
src/reference_data/commands_snapshot.json:590:    "responsibility": "Command module mirrored from archived TypeScript path commands/passes/index.ts"
src/reference_data/commands_snapshot.json:595:    "responsibility": "Command module mirrored from archived TypeScript path commands/passes/passes.tsx"
src/reference_data/commands_snapshot.json:600:    "responsibility": "Command module mirrored from archived TypeScript path commands/perf-issue/index.js"
src/reference_data/commands_snapshot.json:605:    "responsibility": "Command module mirrored from archived TypeScript path commands/permissions/index.ts"
src/reference_data/commands_snapshot.json:610:    "responsibility": "Command module mirrored from archived TypeScript path commands/permissions/permissions.tsx"
src/reference_data/commands_snapshot.json:615:    "responsibility": "Command module mirrored from archived TypeScript path commands/plan/index.ts"
src/reference_data/commands_snapshot.json:620:    "responsibility": "Command module mirrored from archived TypeScript path commands/plan/plan.tsx"
src/reference_data/commands_snapshot.json:625:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/AddMarketplace.tsx"
src/reference_data/commands_snapshot.json:630:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/BrowseMarketplace.tsx"
src/reference_data/commands_snapshot.json:635:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/DiscoverPlugins.tsx"
src/reference_data/commands_snapshot.json:640:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/ManageMarketplaces.tsx"
src/reference_data/commands_snapshot.json:645:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/ManagePlugins.tsx"
src/reference_data/commands_snapshot.json:650:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/PluginErrors.tsx"
src/reference_data/commands_snapshot.json:655:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/PluginOptionsDialog.tsx"
src/reference_data/commands_snapshot.json:660:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/PluginOptionsFlow.tsx"
src/reference_data/commands_snapshot.json:665:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/PluginSettings.tsx"
src/reference_data/commands_snapshot.json:670:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/PluginTrustWarning.tsx"
src/reference_data/commands_snapshot.json:675:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/UnifiedInstalledCell.tsx"
src/reference_data/commands_snapshot.json:680:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/ValidatePlugin.tsx"
src/reference_data/commands_snapshot.json:685:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/index.tsx"
src/reference_data/commands_snapshot.json:690:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/parseArgs.ts"
src/reference_data/commands_snapshot.json:695:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/plugin.tsx"
src/reference_data/commands_snapshot.json:700:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/pluginDetailsHelpers.tsx"
src/reference_data/commands_snapshot.json:705:    "responsibility": "Command module mirrored from archived TypeScript path commands/plugin/usePagination.ts"
src/reference_data/commands_snapshot.json:710:    "responsibility": "Command module mirrored from archived TypeScript path commands/pr_comments/index.ts"
src/reference_data/commands_snapshot.json:715:    "responsibility": "Command module mirrored from archived TypeScript path commands/privacy-settings/index.ts"
src/reference_data/commands_snapshot.json:720:    "responsibility": "Command module mirrored from archived TypeScript path commands/privacy-settings/privacy-settings.tsx"
src/reference_data/commands_snapshot.json:725:    "responsibility": "Command module mirrored from archived TypeScript path commands/rate-limit-options/index.ts"
src/reference_data/commands_snapshot.json:730:    "responsibility": "Command module mirrored from archived TypeScript path commands/rate-limit-options/rate-limit-options.tsx"
src/reference_data/commands_snapshot.json:735:    "responsibility": "Command module mirrored from archived TypeScript path commands/release-notes/index.ts"
src/reference_data/commands_snapshot.json:740:    "responsibility": "Command module mirrored from archived TypeScript path commands/release-notes/release-notes.ts"
src/reference_data/commands_snapshot.json:745:    "responsibility": "Command module mirrored from archived TypeScript path commands/reload-plugins/index.ts"
src/reference_data/commands_snapshot.json:750:    "responsibility": "Command module mirrored from archived TypeScript path commands/reload-plugins/reload-plugins.ts"
src/reference_data/commands_snapshot.json:755:    "responsibility": "Command module mirrored from archived TypeScript path commands/remote-env/index.ts"
src/reference_data/commands_snapshot.json:760:    "responsibility": "Command module mirrored from archived TypeScript path commands/remote-env/remote-env.tsx"
src/reference_data/commands_snapshot.json:765:    "responsibility": "Command module mirrored from archived TypeScript path commands/remote-setup/api.ts"
src/reference_data/commands_snapshot.json:770:    "responsibility": "Command module mirrored from archived TypeScript path commands/remote-setup/index.ts"
src/reference_data/commands_snapshot.json:775:    "responsibility": "Command module mirrored from archived TypeScript path commands/remote-setup/remote-setup.tsx"
src/reference_data/commands_snapshot.json:780:    "responsibility": "Command module mirrored from archived TypeScript path commands/rename/generateSessionName.ts"
src/reference_data/commands_snapshot.json:785:    "responsibility": "Command module mirrored from archived TypeScript path commands/rename/index.ts"
src/reference_data/commands_snapshot.json:790:    "responsibility": "Command module mirrored from archived TypeScript path commands/rename/rename.ts"
src/reference_data/commands_snapshot.json:795:    "responsibility": "Command module mirrored from archived TypeScript path commands/reset-limits/index.js"
src/reference_data/commands_snapshot.json:800:    "responsibility": "Command module mirrored from archived TypeScript path commands/resume/index.ts"
src/reference_data/commands_snapshot.json:805:    "responsibility": "Command module mirrored from archived TypeScript path commands/resume/resume.tsx"
src/reference_data/commands_snapshot.json:810:    "responsibility": "Command module mirrored from archived TypeScript path commands/review/UltrareviewOverageDialog.tsx"
src/reference_data/commands_snapshot.json:815:    "responsibility": "Command module mirrored from archived TypeScript path commands/review/reviewRemote.ts"
src/reference_data/commands_snapshot.json:820:    "responsibility": "Command module mirrored from archived TypeScript path commands/review/ultrareviewCommand.tsx"
src/reference_data/commands_snapshot.json:825:    "responsibility": "Command module mirrored from archived TypeScript path commands/review/ultrareviewEnabled.ts"
src/reference_data/commands_snapshot.json:830:    "responsibility": "Command module mirrored from archived TypeScript path commands/review.ts"
src/reference_data/commands_snapshot.json:835:    "responsibility": "Command module mirrored from archived TypeScript path commands/rewind/index.ts"
src/reference_data/commands_snapshot.json:840:    "responsibility": "Command module mirrored from archived TypeScript path commands/rewind/rewind.ts"
src/reference_data/commands_snapshot.json:845:    "responsibility": "Command module mirrored from archived TypeScript path commands/sandbox-toggle/index.ts"
src/reference_data/commands_snapshot.json:850:    "responsibility": "Command module mirrored from archived TypeScript path commands/sandbox-toggle/sandbox-toggle.tsx"
src/reference_data/commands_snapshot.json:855:    "responsibility": "Command module mirrored from archived TypeScript path commands/security-review.ts"
src/reference_data/commands_snapshot.json:858:    "name": "session",
src/reference_data/commands_snapshot.json:859:    "source_hint": "commands/session/index.ts",
src/reference_data/commands_snapshot.json:860:    "responsibility": "Command module mirrored from archived TypeScript path commands/session/index.ts"
src/reference_data/commands_snapshot.json:863:    "name": "session",
src/reference_data/commands_snapshot.json:864:    "source_hint": "commands/session/session.tsx",
src/reference_data/commands_snapshot.json:865:    "responsibility": "Command module mirrored from archived TypeScript path commands/session/session.tsx"
src/reference_data/commands_snapshot.json:870:    "responsibility": "Command module mirrored from archived TypeScript path commands/share/index.js"
src/reference_data/commands_snapshot.json:875:    "responsibility": "Command module mirrored from archived TypeScript path commands/skills/index.ts"
src/reference_data/commands_snapshot.json:880:    "responsibility": "Command module mirrored from archived TypeScript path commands/skills/skills.tsx"
src/reference_data/commands_snapshot.json:885:    "responsibility": "Command module mirrored from archived TypeScript path commands/stats/index.ts"
src/reference_data/commands_snapshot.json:890:    "responsibility": "Command module mirrored from archived TypeScript path commands/stats/stats.tsx"
src/reference_data/commands_snapshot.json:895:    "responsibility": "Command module mirrored from archived TypeScript path commands/status/index.ts"
src/reference_data/commands_snapshot.json:900:    "responsibility": "Command module mirrored from archived TypeScript path commands/status/status.tsx"
src/reference_data/commands_snapshot.json:905:    "responsibility": "Command module mirrored from archived TypeScript path commands/statusline.tsx"
src/reference_data/commands_snapshot.json:910:    "responsibility": "Command module mirrored from archived TypeScript path commands/stickers/index.ts"
src/reference_data/commands_snapshot.json:915:    "responsibility": "Command module mirrored from archived TypeScript path commands/stickers/stickers.ts"
src/reference_data/commands_snapshot.json:920:    "responsibility": "Command module mirrored from archived TypeScript path commands/summary/index.js"
src/reference_data/commands_snapshot.json:925:    "responsibility": "Command module mirrored from archived TypeScript path commands/tag/index.ts"
src/reference_data/commands_snapshot.json:930:    "responsibility": "Command module mirrored from archived TypeScript path commands/tag/tag.tsx"
src/reference_data/commands_snapshot.json:935:    "responsibility": "Command module mirrored from archived TypeScript path commands/tasks/index.ts"
src/reference_data/commands_snapshot.json:940:    "responsibility": "Command module mirrored from archived TypeScript path commands/tasks/tasks.tsx"
src/reference_data/commands_snapshot.json:945:    "responsibility": "Command module mirrored from archived TypeScript path commands/teleport/index.js"
src/reference_data/commands_snapshot.json:950:    "responsibility": "Command module mirrored from archived TypeScript path commands/terminalSetup/index.ts"
src/reference_data/commands_snapshot.json:955:    "responsibility": "Command module mirrored from archived TypeScript path commands/terminalSetup/terminalSetup.tsx"
src/reference_data/commands_snapshot.json:960:    "responsibility": "Command module mirrored from archived TypeScript path commands/theme/index.ts"
src/reference_data/commands_snapshot.json:965:    "responsibility": "Command module mirrored from archived TypeScript path commands/theme/theme.tsx"
src/reference_data/commands_snapshot.json:970:    "responsibility": "Command module mirrored from archived TypeScript path commands/thinkback/index.ts"
src/reference_data/commands_snapshot.json:975:    "responsibility": "Command module mirrored from archived TypeScript path commands/thinkback/thinkback.tsx"
src/reference_data/commands_snapshot.json:980:    "responsibility": "Command module mirrored from archived TypeScript path commands/thinkback-play/index.ts"
src/reference_data/commands_snapshot.json:985:    "responsibility": "Command module mirrored from archived TypeScript path commands/thinkback-play/thinkback-play.ts"
src/reference_data/commands_snapshot.json:990:    "responsibility": "Command module mirrored from archived TypeScript path commands/ultraplan.tsx"
src/reference_data/commands_snapshot.json:995:    "responsibility": "Command module mirrored from archived TypeScript path commands/upgrade/index.ts"
src/reference_data/commands_snapshot.json:1000:    "responsibility": "Command module mirrored from archived TypeScript path commands/upgrade/upgrade.tsx"
src/reference_data/commands_snapshot.json:1005:    "responsibility": "Command module mirrored from archived TypeScript path commands/usage/index.ts"
src/reference_data/commands_snapshot.json:1010:    "responsibility": "Command module mirrored from archived TypeScript path commands/usage/usage.tsx"
src/reference_data/commands_snapshot.json:1015:    "responsibility": "Command module mirrored from archived TypeScript path commands/version.ts"
src/reference_data/commands_snapshot.json:1020:    "responsibility": "Command module mirrored from archived TypeScript path commands/vim/index.ts"
src/reference_data/commands_snapshot.json:1025:    "responsibility": "Command module mirrored from archived TypeScript path commands/vim/vim.ts"
src/reference_data/commands_snapshot.json:1030:    "responsibility": "Command module mirrored from archived TypeScript path commands/voice/index.ts"
src/reference_data/commands_snapshot.json:1035:    "responsibility": "Command module mirrored from archived TypeScript path commands/voice/voice.ts"
src/setup.py:6:from pathlib import Path
src/session_store.py:5:from pathlib import Path
src/session_store.py:10:    session_id: str
src/session_store.py:12:    input_tokens: int
src/session_store.py:13:    output_tokens: int
src/session_store.py:16:DEFAULT_SESSION_DIR = Path('.port_sessions')
src/session_store.py:19:def save_session(session: StoredSession, directory: Path | None = None) -> Path:
src/session_store.py:22:    path = target_dir / f'{session.session_id}.json'
src/session_store.py:23:    path.write_text(json.dumps(asdict(session), indent=2))
src/session_store.py:24:    return path
src/session_store.py:27:def load_session(session_id: str, directory: Path | None = None) -> StoredSession:
src/session_store.py:29:    data = json.loads((target_dir / f'{session_id}.json').read_text())
src/session_store.py:31:        session_id=data['session_id'],
src/session_store.py:33:        input_tokens=data['input_tokens'],
src/session_store.py:34:        output_tokens=data['output_tokens'],
src/tools.py:6:from pathlib import Path
src/tools.py:81:def execute_tool(name: str, payload: str = '') -> ToolExecution:
src/reference_data/subsystems/assistant.json:6:    "assistant/sessionHistory.ts"
src/reference_data/subsystems/memdir.json:11:    "memdir/paths.ts",
src/reference_data/subsystems/upstreamproxy.json:2:  "archive_name": "upstreamproxy",
src/reference_data/subsystems/upstreamproxy.json:3:  "package_name": "upstreamproxy",
src/reference_data/subsystems/upstreamproxy.json:6:    "upstreamproxy/relay.ts",
src/reference_data/subsystems/upstreamproxy.json:7:    "upstreamproxy/upstreamproxy.ts"
src/reference_data/subsystems/services.json:12:    "services/SessionMemory/sessionMemory.ts",
src/reference_data/subsystems/services.json:13:    "services/SessionMemory/sessionMemoryUtils.ts",
src/reference_data/tools_snapshot.json:5:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/AgentTool.tsx"
src/reference_data/tools_snapshot.json:10:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/UI.tsx"
src/reference_data/tools_snapshot.json:15:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/agentColorManager.ts"
src/reference_data/tools_snapshot.json:20:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/agentDisplay.ts"
src/reference_data/tools_snapshot.json:25:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/agentMemory.ts"
src/reference_data/tools_snapshot.json:30:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/agentMemorySnapshot.ts"
src/reference_data/tools_snapshot.json:35:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/agentToolUtils.ts"
src/reference_data/tools_snapshot.json:40:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/built-in/claudeCodeGuideAgent.ts"
src/reference_data/tools_snapshot.json:45:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/built-in/exploreAgent.ts"
src/reference_data/tools_snapshot.json:50:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/built-in/generalPurposeAgent.ts"
src/reference_data/tools_snapshot.json:55:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/built-in/planAgent.ts"
src/reference_data/tools_snapshot.json:60:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/built-in/statuslineSetup.ts"
src/reference_data/tools_snapshot.json:65:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/built-in/verificationAgent.ts"
src/reference_data/tools_snapshot.json:70:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/builtInAgents.ts"
src/reference_data/tools_snapshot.json:75:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/constants.ts"
src/reference_data/tools_snapshot.json:80:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/forkSubagent.ts"
src/reference_data/tools_snapshot.json:85:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/loadAgentsDir.ts"
src/reference_data/tools_snapshot.json:90:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/prompt.ts"
src/reference_data/tools_snapshot.json:95:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/resumeAgent.ts"
src/reference_data/tools_snapshot.json:100:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AgentTool/runAgent.ts"
src/reference_data/tools_snapshot.json:105:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AskUserQuestionTool/AskUserQuestionTool.tsx"
src/reference_data/tools_snapshot.json:110:    "responsibility": "Tool module mirrored from archived TypeScript path tools/AskUserQuestionTool/prompt.ts"
src/reference_data/tools_snapshot.json:115:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/BashTool.tsx"
src/reference_data/tools_snapshot.json:120:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/BashToolResultMessage.tsx"
src/reference_data/tools_snapshot.json:125:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/UI.tsx"
src/reference_data/tools_snapshot.json:130:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/bashCommandHelpers.ts"
src/reference_data/tools_snapshot.json:135:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/bashPermissions.ts"
src/reference_data/tools_snapshot.json:140:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/bashSecurity.ts"
src/reference_data/tools_snapshot.json:145:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/commandSemantics.ts"
src/reference_data/tools_snapshot.json:150:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/commentLabel.ts"
src/reference_data/tools_snapshot.json:155:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/destructiveCommandWarning.ts"
src/reference_data/tools_snapshot.json:160:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/modeValidation.ts"
src/reference_data/tools_snapshot.json:163:    "name": "pathValidation",
src/reference_data/tools_snapshot.json:164:    "source_hint": "tools/BashTool/pathValidation.ts",
src/reference_data/tools_snapshot.json:165:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/pathValidation.ts"
src/reference_data/tools_snapshot.json:170:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/prompt.ts"
src/reference_data/tools_snapshot.json:175:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/readOnlyValidation.ts"
src/reference_data/tools_snapshot.json:180:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/sedEditParser.ts"
src/reference_data/tools_snapshot.json:185:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/sedValidation.ts"
src/reference_data/tools_snapshot.json:190:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/shouldUseSandbox.ts"
src/reference_data/tools_snapshot.json:195:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/toolName.ts"
src/reference_data/tools_snapshot.json:200:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BashTool/utils.ts"
src/reference_data/tools_snapshot.json:205:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BriefTool/BriefTool.ts"
src/reference_data/tools_snapshot.json:210:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BriefTool/UI.tsx"
src/reference_data/tools_snapshot.json:215:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BriefTool/attachments.ts"
src/reference_data/tools_snapshot.json:220:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BriefTool/prompt.ts"
src/reference_data/tools_snapshot.json:225:    "responsibility": "Tool module mirrored from archived TypeScript path tools/BriefTool/upload.ts"
src/reference_data/tools_snapshot.json:230:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ConfigTool/ConfigTool.ts"
src/reference_data/tools_snapshot.json:235:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ConfigTool/UI.tsx"
src/reference_data/tools_snapshot.json:240:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ConfigTool/constants.ts"
src/reference_data/tools_snapshot.json:245:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ConfigTool/prompt.ts"
src/reference_data/tools_snapshot.json:250:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ConfigTool/supportedSettings.ts"
src/reference_data/tools_snapshot.json:255:    "responsibility": "Tool module mirrored from archived TypeScript path tools/EnterPlanModeTool/EnterPlanModeTool.ts"
src/reference_data/tools_snapshot.json:260:    "responsibility": "Tool module mirrored from archived TypeScript path tools/EnterPlanModeTool/UI.tsx"
src/reference_data/tools_snapshot.json:265:    "responsibility": "Tool module mirrored from archived TypeScript path tools/EnterPlanModeTool/constants.ts"
src/reference_data/tools_snapshot.json:270:    "responsibility": "Tool module mirrored from archived TypeScript path tools/EnterPlanModeTool/prompt.ts"
src/reference_data/tools_snapshot.json:275:    "responsibility": "Tool module mirrored from archived TypeScript path tools/EnterWorktreeTool/EnterWorktreeTool.ts"
src/reference_data/tools_snapshot.json:280:    "responsibility": "Tool module mirrored from archived TypeScript path tools/EnterWorktreeTool/UI.tsx"
src/reference_data/tools_snapshot.json:285:    "responsibility": "Tool module mirrored from archived TypeScript path tools/EnterWorktreeTool/constants.ts"
src/reference_data/tools_snapshot.json:290:    "responsibility": "Tool module mirrored from archived TypeScript path tools/EnterWorktreeTool/prompt.ts"
src/reference_data/tools_snapshot.json:295:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ExitPlanModeTool/ExitPlanModeV2Tool.ts"
src/reference_data/tools_snapshot.json:300:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ExitPlanModeTool/UI.tsx"
src/reference_data/tools_snapshot.json:305:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ExitPlanModeTool/constants.ts"
src/reference_data/tools_snapshot.json:310:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ExitPlanModeTool/prompt.ts"
src/reference_data/tools_snapshot.json:315:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ExitWorktreeTool/ExitWorktreeTool.ts"
src/reference_data/tools_snapshot.json:320:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ExitWorktreeTool/UI.tsx"
src/reference_data/tools_snapshot.json:325:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ExitWorktreeTool/constants.ts"
src/reference_data/tools_snapshot.json:330:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ExitWorktreeTool/prompt.ts"
src/reference_data/tools_snapshot.json:335:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileEditTool/FileEditTool.ts"
src/reference_data/tools_snapshot.json:340:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileEditTool/UI.tsx"
src/reference_data/tools_snapshot.json:345:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileEditTool/constants.ts"
src/reference_data/tools_snapshot.json:350:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileEditTool/prompt.ts"
src/reference_data/tools_snapshot.json:355:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileEditTool/types.ts"
src/reference_data/tools_snapshot.json:360:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileEditTool/utils.ts"
src/reference_data/tools_snapshot.json:365:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileReadTool/FileReadTool.ts"
src/reference_data/tools_snapshot.json:370:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileReadTool/UI.tsx"
src/reference_data/tools_snapshot.json:375:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileReadTool/imageProcessor.ts"
src/reference_data/tools_snapshot.json:380:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileReadTool/limits.ts"
src/reference_data/tools_snapshot.json:385:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileReadTool/prompt.ts"
src/reference_data/tools_snapshot.json:390:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileWriteTool/FileWriteTool.ts"
src/reference_data/tools_snapshot.json:395:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileWriteTool/UI.tsx"
src/reference_data/tools_snapshot.json:400:    "responsibility": "Tool module mirrored from archived TypeScript path tools/FileWriteTool/prompt.ts"
src/reference_data/tools_snapshot.json:405:    "responsibility": "Tool module mirrored from archived TypeScript path tools/GlobTool/GlobTool.ts"
src/reference_data/tools_snapshot.json:410:    "responsibility": "Tool module mirrored from archived TypeScript path tools/GlobTool/UI.tsx"
src/reference_data/tools_snapshot.json:415:    "responsibility": "Tool module mirrored from archived TypeScript path tools/GlobTool/prompt.ts"
src/reference_data/tools_snapshot.json:420:    "responsibility": "Tool module mirrored from archived TypeScript path tools/GrepTool/GrepTool.ts"
src/reference_data/tools_snapshot.json:425:    "responsibility": "Tool module mirrored from archived TypeScript path tools/GrepTool/UI.tsx"
src/reference_data/tools_snapshot.json:430:    "responsibility": "Tool module mirrored from archived TypeScript path tools/GrepTool/prompt.ts"
src/reference_data/tools_snapshot.json:435:    "responsibility": "Tool module mirrored from archived TypeScript path tools/LSPTool/LSPTool.ts"
src/reference_data/tools_snapshot.json:440:    "responsibility": "Tool module mirrored from archived TypeScript path tools/LSPTool/UI.tsx"
src/reference_data/tools_snapshot.json:445:    "responsibility": "Tool module mirrored from archived TypeScript path tools/LSPTool/formatters.ts"
src/reference_data/tools_snapshot.json:450:    "responsibility": "Tool module mirrored from archived TypeScript path tools/LSPTool/prompt.ts"
src/reference_data/tools_snapshot.json:455:    "responsibility": "Tool module mirrored from archived TypeScript path tools/LSPTool/schemas.ts"
src/reference_data/tools_snapshot.json:460:    "responsibility": "Tool module mirrored from archived TypeScript path tools/LSPTool/symbolContext.ts"
src/reference_data/tools_snapshot.json:465:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ListMcpResourcesTool/ListMcpResourcesTool.ts"
src/reference_data/tools_snapshot.json:470:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ListMcpResourcesTool/UI.tsx"
src/reference_data/tools_snapshot.json:475:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ListMcpResourcesTool/prompt.ts"
src/reference_data/tools_snapshot.json:480:    "responsibility": "Tool module mirrored from archived TypeScript path tools/MCPTool/MCPTool.ts"
src/reference_data/tools_snapshot.json:485:    "responsibility": "Tool module mirrored from archived TypeScript path tools/MCPTool/UI.tsx"
src/reference_data/tools_snapshot.json:490:    "responsibility": "Tool module mirrored from archived TypeScript path tools/MCPTool/classifyForCollapse.ts"
src/reference_data/tools_snapshot.json:495:    "responsibility": "Tool module mirrored from archived TypeScript path tools/MCPTool/prompt.ts"
src/reference_data/tools_snapshot.json:500:    "responsibility": "Tool module mirrored from archived TypeScript path tools/McpAuthTool/McpAuthTool.ts"
src/reference_data/tools_snapshot.json:505:    "responsibility": "Tool module mirrored from archived TypeScript path tools/NotebookEditTool/NotebookEditTool.ts"
src/reference_data/tools_snapshot.json:510:    "responsibility": "Tool module mirrored from archived TypeScript path tools/NotebookEditTool/UI.tsx"
src/reference_data/tools_snapshot.json:515:    "responsibility": "Tool module mirrored from archived TypeScript path tools/NotebookEditTool/constants.ts"
src/reference_data/tools_snapshot.json:520:    "responsibility": "Tool module mirrored from archived TypeScript path tools/NotebookEditTool/prompt.ts"
src/reference_data/tools_snapshot.json:525:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/PowerShellTool.tsx"
src/reference_data/tools_snapshot.json:530:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/UI.tsx"
src/reference_data/tools_snapshot.json:535:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/clmTypes.ts"
src/reference_data/tools_snapshot.json:540:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/commandSemantics.ts"
src/reference_data/tools_snapshot.json:545:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/commonParameters.ts"
src/reference_data/tools_snapshot.json:550:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/destructiveCommandWarning.ts"
src/reference_data/tools_snapshot.json:555:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/gitSafety.ts"
src/reference_data/tools_snapshot.json:560:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/modeValidation.ts"
src/reference_data/tools_snapshot.json:563:    "name": "pathValidation",
src/reference_data/tools_snapshot.json:564:    "source_hint": "tools/PowerShellTool/pathValidation.ts",
src/reference_data/tools_snapshot.json:565:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/pathValidation.ts"
src/reference_data/tools_snapshot.json:568:    "name": "powershellPermissions",
src/reference_data/tools_snapshot.json:569:    "source_hint": "tools/PowerShellTool/powershellPermissions.ts",
src/reference_data/tools_snapshot.json:570:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/powershellPermissions.ts"
src/reference_data/tools_snapshot.json:573:    "name": "powershellSecurity",
src/reference_data/tools_snapshot.json:574:    "source_hint": "tools/PowerShellTool/powershellSecurity.ts",
src/reference_data/tools_snapshot.json:575:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/powershellSecurity.ts"
src/reference_data/tools_snapshot.json:580:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/prompt.ts"
src/reference_data/tools_snapshot.json:585:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/readOnlyValidation.ts"
src/reference_data/tools_snapshot.json:590:    "responsibility": "Tool module mirrored from archived TypeScript path tools/PowerShellTool/toolName.ts"
src/reference_data/tools_snapshot.json:595:    "responsibility": "Tool module mirrored from archived TypeScript path tools/REPLTool/constants.ts"
src/reference_data/tools_snapshot.json:600:    "responsibility": "Tool module mirrored from archived TypeScript path tools/REPLTool/primitiveTools.ts"
src/reference_data/tools_snapshot.json:605:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ReadMcpResourceTool/ReadMcpResourceTool.ts"
src/reference_data/tools_snapshot.json:610:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ReadMcpResourceTool/UI.tsx"
src/reference_data/tools_snapshot.json:615:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ReadMcpResourceTool/prompt.ts"
src/reference_data/tools_snapshot.json:620:    "responsibility": "Tool module mirrored from archived TypeScript path tools/RemoteTriggerTool/RemoteTriggerTool.ts"
src/reference_data/tools_snapshot.json:625:    "responsibility": "Tool module mirrored from archived TypeScript path tools/RemoteTriggerTool/UI.tsx"
src/reference_data/tools_snapshot.json:630:    "responsibility": "Tool module mirrored from archived TypeScript path tools/RemoteTriggerTool/prompt.ts"
src/reference_data/tools_snapshot.json:635:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ScheduleCronTool/CronCreateTool.ts"
src/reference_data/tools_snapshot.json:640:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ScheduleCronTool/CronDeleteTool.ts"
src/reference_data/tools_snapshot.json:645:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ScheduleCronTool/CronListTool.ts"
src/reference_data/tools_snapshot.json:650:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ScheduleCronTool/UI.tsx"
src/reference_data/tools_snapshot.json:655:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ScheduleCronTool/prompt.ts"
src/reference_data/tools_snapshot.json:660:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SendMessageTool/SendMessageTool.ts"
src/reference_data/tools_snapshot.json:665:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SendMessageTool/UI.tsx"
src/reference_data/tools_snapshot.json:670:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SendMessageTool/constants.ts"
src/reference_data/tools_snapshot.json:675:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SendMessageTool/prompt.ts"
src/reference_data/tools_snapshot.json:680:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SkillTool/SkillTool.ts"
src/reference_data/tools_snapshot.json:685:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SkillTool/UI.tsx"
src/reference_data/tools_snapshot.json:690:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SkillTool/constants.ts"
src/reference_data/tools_snapshot.json:695:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SkillTool/prompt.ts"
src/reference_data/tools_snapshot.json:700:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SleepTool/prompt.ts"
src/reference_data/tools_snapshot.json:705:    "responsibility": "Tool module mirrored from archived TypeScript path tools/SyntheticOutputTool/SyntheticOutputTool.ts"
src/reference_data/tools_snapshot.json:710:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskCreateTool/TaskCreateTool.ts"
src/reference_data/tools_snapshot.json:715:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskCreateTool/constants.ts"
src/reference_data/tools_snapshot.json:720:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskCreateTool/prompt.ts"
src/reference_data/tools_snapshot.json:725:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskGetTool/TaskGetTool.ts"
src/reference_data/tools_snapshot.json:730:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskGetTool/constants.ts"
src/reference_data/tools_snapshot.json:735:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskGetTool/prompt.ts"
src/reference_data/tools_snapshot.json:740:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskListTool/TaskListTool.ts"
src/reference_data/tools_snapshot.json:745:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskListTool/constants.ts"
src/reference_data/tools_snapshot.json:750:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskListTool/prompt.ts"
src/reference_data/tools_snapshot.json:755:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskOutputTool/TaskOutputTool.tsx"
src/reference_data/tools_snapshot.json:760:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskOutputTool/constants.ts"
src/reference_data/tools_snapshot.json:765:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskStopTool/TaskStopTool.ts"
src/reference_data/tools_snapshot.json:770:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskStopTool/UI.tsx"
src/reference_data/tools_snapshot.json:775:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskStopTool/prompt.ts"
src/reference_data/tools_snapshot.json:780:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskUpdateTool/TaskUpdateTool.ts"
src/reference_data/tools_snapshot.json:785:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskUpdateTool/constants.ts"
src/reference_data/tools_snapshot.json:790:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TaskUpdateTool/prompt.ts"
src/reference_data/tools_snapshot.json:795:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TeamCreateTool/TeamCreateTool.ts"
src/reference_data/tools_snapshot.json:800:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TeamCreateTool/UI.tsx"
src/reference_data/tools_snapshot.json:805:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TeamCreateTool/constants.ts"
src/reference_data/tools_snapshot.json:810:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TeamCreateTool/prompt.ts"
src/reference_data/tools_snapshot.json:815:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TeamDeleteTool/TeamDeleteTool.ts"
src/reference_data/tools_snapshot.json:820:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TeamDeleteTool/UI.tsx"
src/reference_data/tools_snapshot.json:825:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TeamDeleteTool/constants.ts"
src/reference_data/tools_snapshot.json:830:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TeamDeleteTool/prompt.ts"
src/reference_data/tools_snapshot.json:835:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TodoWriteTool/TodoWriteTool.ts"
src/reference_data/tools_snapshot.json:840:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TodoWriteTool/constants.ts"
src/reference_data/tools_snapshot.json:845:    "responsibility": "Tool module mirrored from archived TypeScript path tools/TodoWriteTool/prompt.ts"
src/reference_data/tools_snapshot.json:850:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ToolSearchTool/ToolSearchTool.ts"
src/reference_data/tools_snapshot.json:855:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ToolSearchTool/constants.ts"
src/reference_data/tools_snapshot.json:860:    "responsibility": "Tool module mirrored from archived TypeScript path tools/ToolSearchTool/prompt.ts"
src/reference_data/tools_snapshot.json:865:    "responsibility": "Tool module mirrored from archived TypeScript path tools/WebFetchTool/UI.tsx"
src/reference_data/tools_snapshot.json:870:    "responsibility": "Tool module mirrored from archived TypeScript path tools/WebFetchTool/WebFetchTool.ts"
src/reference_data/tools_snapshot.json:875:    "responsibility": "Tool module mirrored from archived TypeScript path tools/WebFetchTool/preapproved.ts"
src/reference_data/tools_snapshot.json:880:    "responsibility": "Tool module mirrored from archived TypeScript path tools/WebFetchTool/prompt.ts"
src/reference_data/tools_snapshot.json:885:    "responsibility": "Tool module mirrored from archived TypeScript path tools/WebFetchTool/utils.ts"
src/reference_data/tools_snapshot.json:890:    "responsibility": "Tool module mirrored from archived TypeScript path tools/WebSearchTool/UI.tsx"
src/reference_data/tools_snapshot.json:895:    "responsibility": "Tool module mirrored from archived TypeScript path tools/WebSearchTool/WebSearchTool.ts"
src/reference_data/tools_snapshot.json:900:    "responsibility": "Tool module mirrored from archived TypeScript path tools/WebSearchTool/prompt.ts"
src/reference_data/tools_snapshot.json:905:    "responsibility": "Tool module mirrored from archived TypeScript path tools/shared/gitOperationTracking.ts"
src/reference_data/tools_snapshot.json:908:    "name": "spawnMultiAgent",
src/reference_data/tools_snapshot.json:909:    "source_hint": "tools/shared/spawnMultiAgent.ts",
src/reference_data/tools_snapshot.json:910:    "responsibility": "Tool module mirrored from archived TypeScript path tools/shared/spawnMultiAgent.ts"
src/reference_data/tools_snapshot.json:915:    "responsibility": "Tool module mirrored from archived TypeScript path tools/testing/TestingPermissionTool.tsx"
src/reference_data/tools_snapshot.json:920:    "responsibility": "Tool module mirrored from archived TypeScript path tools/utils.ts"

## Public mutable ownership surfaces
