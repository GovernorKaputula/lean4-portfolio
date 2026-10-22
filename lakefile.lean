import Lake
open Lake DSL

package leanPortfolio where
  moreLeanArgs := #["-DwarningAsError=true"]

@[default_target]
lean_lib LeanPortfolio
