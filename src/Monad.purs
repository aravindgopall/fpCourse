module Course.Monad where


import Course.Applicative (class Applicative)
import Course.Array (CArray, Maybe)
import Unsafe.Coerce (unsafeCoerce)


class Bind m where
    bind :: forall a b.m a-> ( a-> m b)-> m b

class (Bind m, Applicative m) <= Monad m



instance bindForCArray :: Bind CArray where
    bind = unsafeCoerce 

instance monadForCArray :: Monad CArray

instance bindForMaybe :: Bind Maybe where
    bind :: forall a b. Maybe a ->(a -> Maybe b)-> Maybe b
    bind  = unsafeCoerce

instance monadMaybe ::Monad Maybe


instance bindForFunction :: Bind ((->) t) where
    bind :: forall a b.((->) t a) -> (a -> (->)t b) -> ((->)t b)
    bind  = unsafeCoerce  

instance fnMonad :: Monad ((->) t)

join :: forall m a.
     Monad m =>
     m (m a) ->
     m a
join = unsafeCoerce 

-- kleisli composition

kleisli :: forall m a b c.
        Monad m =>
        (b -> m c) ->
        (a -> m b) ->
        a ->
        m c
kleisli = unsafeCoerce
