module nat-to-string where

open import bool
open import char
open import eq
open import list
open import maybe
open import nat
open import nat-division
open import nat-thms
open import product
open import string
open import well-founded

ℕ-to-digitsh : (x : ℕ) → WfStructBool _<_ x → 𝕃 ℕ
ℕ-to-digitsh 0 _ = []
ℕ-to-digitsh (suc x) (WfStep fx) with (suc x) ÷ 10 ! refl
... | q , r , p = r :: (ℕ-to-digitsh q (fx (÷<{10}{q}{r}{x} refl p)))

ℕ-to-digits : ℕ → 𝕃 ℕ
ℕ-to-digits x = reverse (ℕ-to-digitsh x (wf-< x))

digit-to-string : ℕ → string
digit-to-string 0 = "0"
digit-to-string 1 = "1"
digit-to-string 2 = "2"
digit-to-string 3 = "3"
digit-to-string 4 = "4"
digit-to-string 5 = "5"
digit-to-string 6 = "6"
digit-to-string 7 = "7"
digit-to-string 8 = "8"
digit-to-string 9 = "9"
digit-to-string _ = "unexpected-digit"

digits-to-string : 𝕃 ℕ → string
digits-to-string [] = ""
digits-to-string (d :: ds) = (digit-to-string d) ^ (digits-to-string ds)

ℕ-to-string : ℕ → string
ℕ-to-string 0 = "0"
ℕ-to-string (suc x) = digits-to-string (ℕ-to-digits (suc x))

string-to-digit : char → maybe ℕ 
string-to-digit '0' = just 0
string-to-digit '1' = just 1
string-to-digit '2' = just 2
string-to-digit '3' = just 3
string-to-digit '4' = just 4
string-to-digit '5' = just 5
string-to-digit '6' = just 6
string-to-digit '7' = just 7
string-to-digit '8' = just 8
string-to-digit '9' = just 9
string-to-digit _ = nothing

-- the digits are in order from least to most significant
digits-to-ℕh : ℕ → ℕ → 𝕃 ℕ → ℕ
digits-to-ℕh multiplier sum [] = sum
digits-to-ℕh multiplier sum (x :: xs) = digits-to-ℕh (10 * multiplier) (x * multiplier + sum) xs

digits-to-ℕ : 𝕃 ℕ → ℕ
digits-to-ℕ digits = digits-to-ℕh 1 0 digits

string-to-ℕ : string → maybe ℕ
string-to-ℕ s with maybe-map string-to-digit (reverse (string-to-𝕃char s)) 
... | nothing = nothing
... | just ds = just (digits-to-ℕ ds)