module compose where

open import level
open import eq

{- Note that the Agda standard library has an interesting generalization
   of the following basic composition operator, with more dependent typing. -}

_∘_ : ∀{ℓ ℓ' ℓ''}{A : Set ℓ}{B : Set ℓ'}{C : Set ℓ''} →
      (B → C) → (A → B) → (A → C)
f ∘ g = λ x → f (g x)

∘-assoc : ∀{ℓ ℓ' ℓ'' ℓ'''}{A : Set ℓ}{B : Set ℓ'}{C : Set ℓ''}{D : Set ℓ'''}
           (f : C → D)(g : B → C)(h : A → B) → (f ∘ g) ∘ h ≡ f ∘ (g ∘ h)
∘-assoc f g h = refl

id : ∀{ℓ}{A : Set ℓ} → A → A
id = λ x → x

∘-id : ∀{ℓ ℓ'}{A : Set ℓ}{B : Set ℓ'}(f : A → B) → f ∘ id ≡ f
∘-id f = refl

id-∘ : ∀{ℓ ℓ'}{A : Set ℓ}{B : Set ℓ'}(f : A → B) → id ∘ f ≡ f
id-∘ f = refl