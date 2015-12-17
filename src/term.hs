module Main where
data Color = Normal | Red | Green | Black | Yellow | Blue
  deriving (Show)

type ColorStringUnit = (Color, String)

type ColorOutput = [ColorStringUnit]

getColorString :: Color -> String
getColorString Normal = "\ESC[39m"
getColorString Red = "\ESC[31m"
getColorString Green = "\ESC[32m"
getColorString Blue = "\ESC[34m"
getColorString Black = "\ESC[30m"
getColorString Yellow = "\ESC[33m"
--getColorString _ = error "not implemented"

generateColor :: ColorStringUnit -> String
generateColor (col, str) = getColorString col ++ str ++ getColorString Normal

generateString :: ColorOutput -> String
generateString = concatMap generateColor

main :: IO ()
main = putStrLn $ generateString [(Blue, "Hello "), (Red, "World")]
