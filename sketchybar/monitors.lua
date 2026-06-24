-- Mirrors aerospace.toml workspace + gap layout. Add new external monitors here and in aerospace.toml.
return {
  benq_top_gap = 40,
  dell_top_gap = 38,
  -- Left/right inset on all monitors (stops border bleed at screen edges)
  side_gap = 2,
  builtin_side_gap = 1,
  external_monitors = {
    "BenQ EX2710Q",
    "DELL S2721HN",
  },
  -- aerospace monitor id (string) -> workspace numbers on that monitor
  workspaces_by_monitor = {
    ["1"] = { 1 },
    ["2"] = { 2, 3, 4, 5, 6, 7, 8, 9 },
  },
}
