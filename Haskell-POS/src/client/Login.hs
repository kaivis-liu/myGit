module Login where

import Graphics.UI.WX 
import POS
import UDPClient
import UDPTypes
import Utils


main :: IO ()
main
  = start entryPOS
  
entryPOS :: IO ()
entryPOS
  = do f    <- frame  [text := "Welcome to Pizza-point-sales-order-system", resizeable := False]
       title <- staticText f [text := "  Welcome to our pizza shop  ",textBgcolor := red]
       nameLabel <- staticText f [text := "User name "]
       name  <- entry  f []
       psLabel <- staticText f [text := " Password "]
       password <- entry  f []
       warn0 <- staticText f []
       h  <- openlog "localhost" "1514" "Login"
       h1 <- openlog "localhost" "1514" "Register"
       login <- button f [text := "login",fontSize := 12, fontUnderline:= False ,on command := loginCheck f name password warn0 h]
       register <- button f [text := "register",  fontSize := 12, fontUnderline:= False ,on command := registCheck f name password warn0 h1  ]
       set f [
                --bgcolor := green,
               -- image := "/resource/main1.jpg",
               --area := rect (pt 200 300) (sz 400 500),
               -- outerSize := sz 100 100,
                picture := "resource/main1.jpg",
                --layout :=  column 10 
                layout :=  margin 10 $ floatCentre $ column 60
                        [ row 1 [ widget title]
                        , row 4 [ widget nameLabel, widget name ]
                        , row 5 [widget psLabel, widget password]
       									, row 6 [widget login, widget register ]
       									, row 20 [widget warn0]
       									 ]
       									 , clientSize := sz 400 600
       			 ]
       			 
loginCheck:: Frame()->TextCtrl()->TextCtrl()->StaticText()->SyslogHandle -> IO()    			 
--loginCheck f = do mainPos
--                     close f
loginCheck f e1 e2 warn0 h = do txt1 <- get e1 text
                                txt2 <- get e2 text
                                syslog h USER INFO ("Login" ++" "++ txt1 ++ " " ++ txt2)
                                if( elem (txt1,txt2) users == True ) then do mainPos  (txt1++"" )
                                                                             close f
                                                                        else do set warn0 [text := "uncorrect password!",textBgcolor := red]
                                if txt1 == "kaivis" 
                                   then  do  if txt2 == "123"  
                                               then do mainPos (txt1++"" ) 
                                                       close f   
                                               else do set warn0 [text := "uncorrect password!",textBgcolor := red]
                                    else do 
                                           set warn0 [text := "uncorrect user name!",textBgcolor := red]
                                      
registCheck f e1 e2 warn0 h = do txt1 <- get e1 text
                                 txt2 <- get e2 text
                                 let users=(txt1,txt2):users
                                 syslog h USER INFO ("Register" ++" "++ txt1 ++ " " ++ txt2)
      	                      
--checkDB:: string->string->Bool   
--checkDB str1 str2 =  if  str1 EQ userName
--                     then True	   
--                     else False

