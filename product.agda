module product where

open import level

----------------------------------------------------------------------
-- types
----------------------------------------------------------------------

data Σ {ℓ ℓ'} (A : Set ℓ) (B : A → Set ℓ') : Set (ℓ ⊔ ℓ') where
  _,_ : (a : A) → (b : B a) → Σ A B

data Σi {ℓ ℓ'} (A : Set ℓ) (B : A → Set ℓ') : Set (ℓ ⊔ ℓ') where
  ,_ : {a : A} → (b : B a) → Σi A B

_×_ : ∀ {ℓ ℓ'} (A : Set ℓ) (B : Set ℓ') → Set (ℓ ⊔ ℓ')
A × B = Σ A (λ x → B)

_i×_ : ∀ {ℓ ℓ'} (A : Set ℓ) (B : Set ℓ') → Set (ℓ ⊔ ℓ')
A i× B = Σi A (λ x → B)

----------------------------------------------------------------------
-- syntax
----------------------------------------------------------------------

infixr 3 _×_ _i×_ _∧_
infixr 4 _,_ 
infix  4 ,_

----------------------------------------------------------------------
-- operations
----------------------------------------------------------------------
fst : ∀ {ℓ ℓ'} {A : Set ℓ} {B : Set ℓ'} → A × B → A
fst (a , b) = a

snd : ∀ {ℓ ℓ'} {A : Set ℓ} {B : Set ℓ'} → A × B → B
snd (a , b) = b

----------------------------------------------------------------------
-- some logical notation
----------------------------------------------------------------------
_∧_ : ∀ {ℓ ℓ'} (A : Set ℓ) (B : Set ℓ') → Set (ℓ ⊔ ℓ')
_∧_ = _×_

∃ : ∀ {ℓ ℓ'} (A : Set ℓ) (B : A → Set ℓ') → Set (ℓ ⊔ ℓ')
∃ = Σ

∃i : ∀ {ℓ ℓ'} (A : Set ℓ) (B : A → Set ℓ') → Set (ℓ ⊔ ℓ')
∃i = Σi