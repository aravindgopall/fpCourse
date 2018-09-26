module Course.Functor where

import Course.Array (CArray, Maybe)
import Prelude (Unit)
import Unsafe.Coerce (unsafeCoerce)

class Functor f where
    map :: forall a b. (a -> b) -> f a -> f b

infixl 4 map as <$>


-- excersices

instance mapForCArray :: Functor CArray where
    map  = unsafeCoerce 


instance mapForMaybe :: Functor Maybe where
    map :: forall a b. (a -> b) -> Maybe a-> Maybe b
    map = unsafeCoerce 

instance mapForFunction :: Functor ((->)t) where
    map :: forall a b. (a -> b) -> ((->) t a) -> ((->) t b)
    map = unsafeCoerce 


-- Anonymous function which maps constant to functor
voidRight :: forall a b f.
          Functor f =>
          a ->
          f b ->
          f a
voidRight = unsafeCoerce

-- Anonymous function maps to unit 
-- void (Cons 1 (Cons 2 Nil)) = (Cons unit (Cons unit Nil))
void :: forall a f.
     Functor f =>
     f a ->
     f Unit
void = unsafeCoerce
