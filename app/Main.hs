{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE HexFloatLiterals #-}

module Main where

-- import Haskell type representing the C int type
import Foreign.C.Types ( CInt(..), CDouble(..) )

-- Import the sayHello & factorial function
-- from the function.c
foreign import ccall "sayHello" c_sayHello :: IO CInt
foreign import ccall "factorial" c_factorial :: CInt -> IO CInt

-- Import the add & factorial function
-- from the math.cpp
foreign import ccall "add" cpp_add :: CDouble -> CDouble -> CDouble
foreign import ccall "factorialPlus" cpp_factorial :: CInt -> IO CInt

-- use c_factorial function from c Foreign Function
doFactorial :: Int -> IO Int
doFactorial n = do
  result <- c_factorial (fromIntegral n)
  return (fromIntegral result)

-- use cpp_factorial function from c++ Foreign Function
doFactorialPP :: Int -> IO Int
doFactorialPP n = do
  result <- cpp_factorial (fromIntegral n)
  return (fromIntegral result)

-- use cpp_add function from c++ Foreign Function
add' :: Double -> Double -> CDouble
add' x y = cpp_add (realToFrac x) (realToFrac y)

main :: IO ()
main = do
  dofac <- doFactorial 5
  dofacpp <- doFactorialPP 10
  putStrLn $  "3.14 + 2.71 = "   ++ show (add' 3.14 2.71) ++ "\n" ++
              "factorial 5 is "  ++ show dofac            ++ "\n" ++
              "factorial 10 is " ++ show dofacpp 
  _ <-  c_sayHello -- Bind the return value of the sayHello function to the _ variable
  return ()
  -- Return an empty tuple () to indicate that 
  -- the main function has a return type of IO ()
