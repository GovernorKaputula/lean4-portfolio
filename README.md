# Lean 4 Portfolio — GovernorKaputula

A small portfolio of formal proofs and verified functional programs in Lean 4.

## Sample work

- **Logic:** constructive conjunction commutativity, implication composition, and distribution over disjunction.
- **Arithmetic:** recursive triangular numbers, a defining equation, and a natural-number induction proof.
- **Verified programs:** a recursive list map with proofs of length preservation and identity.

The examples use Lean core only and contain no `sorry`, `admit`, or custom axioms.

## Run

Install Lean using the official instructions at https://lean-lang.org/install/ and run:

```sh
lake build
```

The toolchain is pinned to Lean 4.19.0 for reproducibility. All samples are in `LeanPortfolio.lean`, organized into three namespaces.

## Verification status

Prepared for compilation with the pinned toolchain. A local Lean compiler was not available during initial preparation; compilation must pass before describing these samples as compiler-verified.

