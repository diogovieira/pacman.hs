import System.IO
import System.Process

parse :: [String] -> String
parse [] = "0" --"Up to date"
parse ("error:":t) = "Error"
parse ("Targets":a:t) = (tail $ init $ init a) -- ++ " new packages"
parse (h:t) = parse t

--main = readFile "file" >>= putStrLn . parse . words
main = do{
	(_,s,_,p) <- runInteractiveCommand "yes \"n\" | pacman -Syu";
	hGetContents s >>= putStrLn . parse . words
}
