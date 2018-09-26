module Course.Applicative where


import Course.Array (CArray, Maybe)
import Course.Functor (class Functor)
import Unsafe.Coerce (unsafeCoerce)


class Functor f <= Applicative f where
    pure :: forall a. a -> f a
    apply :: forall a b. f ( a -> b) -> f a -> f b


instance applicativeForArray :: Applicative CArray where
    pure = unsafeCoerce
    apply = unsafeCoerce


instance applicativeForMaybe :: Applicative Maybe where
    pure = unsafeCoerce
    apply = unsafeCoerce

instance applicativeForFunction :: Applicative ((->) t) where
    pure :: forall a. a -> ((->) t a)
    pure = unsafeCoerce
    apply :: forall a b. ((->) t (a -> b)) -> ((->) t a) -> ((->)t b)
    apply = unsafeCoerce


-- Apply binary function 
lift2 :: forall a b c f.
      Applicative f =>
      ( a -> b -> c) ->
      f a ->
      f b ->
      f c
lift2 = unsafeCoerce 


-- partial apply function
partialRight :: forall a b f.
             Applicative f =>
             f a ->
             f b ->
             f b
partialRight = unsafeCoerce 

partialLeft :: forall a b f.
            Applicative f =>
            f a ->
            f b ->
            f a
partialLeft = unsafeCoerce 


sequence :: forall a f.
         Applicative f =>
         CArray (f a) ->
         f (CArray a)
sequence = unsafeCoerce
