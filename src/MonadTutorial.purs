module Course.MonadTutorial where



import Course.Applicative (class Applicative)
import Course.Functor (class Functor)
import Course.Monad (class Bind)
import Prelude (class Eq, class Show, eq, show)
import Unsafe.Coerce (unsafeCoerce)



foreign import data Jff :: Type -> Type


instance functorForJff :: Functor Jff where
    map = unsafeCoerce


instance applicativeForJff :: Applicative Jff where
    apply = unsafeCoerce 
    pure = unsafeCoerce 


instance bindForJff :: Bind Jff where
    bind = unsafeCoerce

-- Implement the following typeClass Instance
-- 1) Monad
-- 2) MonadEffect
-- 3) Monoid 
-- @ for Jff 

instance showForJff :: Show a => Show (Jff a) where
    show = unsafeCoerce 

instance eqForJff :: Eq a => Eq (Jff a) where
    eq = unsafeCoerce

---- lift a normal value into Monad Jff
liftToJff :: Int -> Jff Int
liftToJff val = unsafeCoerce val

showJff :: forall a. Show a => Jff a -> String -- show (Jff 4) == "4"
showJff = show

equalsJff :: forall a. Eq a => Jff a -> Jff a -> Boolean
equalsJff = eq
