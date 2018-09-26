module Course.Array where

import Prelude (class Eq, Unit, eq, (&&))
import Unsafe.Coerce (unsafeCoerce)


data CArray a= Nil |Cons a (CArray a) 
data Maybe a = Just a | Nothing

instance eqCArrayInt :: Eq a => Eq (CArray a) where
    eq Nil Nil = true
    eq (Cons a b) (Cons c d) = eq a c && eq b d
    eq _ _ = false

instance eqMaybe :: Eq a => Eq (Maybe a) where
    eq Nothing Nothing = true
    eq (Just a) (Just b) = eq a b
    eq _ _ = false

---Exercises

-- Return the head of list or default
-- getHeadOr 1 Nil = 1
-- getHeadOr 1 (Cons 2 (Cons 3 Nil)) = 2
getHeadOr :: forall a.
        a ->
        CArray a ->
        a
getHeadOr = unsafeCoerce

---- Sum of the elements in array
-- sumAll (Cons 1 (Cons 2 Nil)) = 3
sumAll :: 
       CArray Int ->
       Int
sumAll = unsafeCoerce 


-- Return length of array
-- lengthFp (Cons 1 (Cons 2 Nil)) = 2
lengthFp :: forall a.
         CArray a
         -> Int
lengthFp = unsafeCoerce 

-- apply given function on everyelement of array
-- map (+1) (Cons 1 (Cons 2 (Cons 3 Nil))) = (Cons 2 (Cons 3 (Cons 4 Nil)))
map :: forall a b.
        (a -> b) ->
        CArray a ->
        CArray b 
map = unsafeCoerce 

-- apply filter on every element of array
{-- filter (>2) (Cons 1 (Cons 0 (Cons 2 (Cons 3 Nil)))) = (Cons 2 (Cons 3 Nil)) --}
filter :: forall a.
           (a -> Boolean) ->
           CArray a ->
           CArray a
filter = unsafeCoerce 

-- flatten the array [[1,2],[3,4]] => [1,2,3,4]
flatten :: forall a.
            CArray (CArray a) ->
            CArray a
flatten = unsafeCoerce

-- find element present in array and return index 
find :: forall a.
     a ->
     CArray a ->
     Maybe Int
find = unsafeCoerce 

-- reverse the array
reverse :: forall a.
        CArray a ->
        CArray a
reverse = unsafeCoerce 

-- convert a array of Maybe values to Maybe of Array
seqMaybe :: forall a.
         CArray (Maybe a) ->
         Maybe (CArray a)
seqMaybe = unsafeCoerce 


-- merge two array by applying a function on them
-- zipWith (+1) (Cons 1 (Cons 2 Nil)) (Cons 2 (Cons 3 Nil)) => (Cons 3 (Cons 5 Nil))
zipWith :: forall a b.
        (a -> a -> b) ->
        CArray a ->
        CArray a ->
        CArray b
zipWith = unsafeCoerce 









             





