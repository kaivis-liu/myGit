module POS where

import Graphics.UI.WX
import Graphics.UI.WXCore
import Control.Monad
import Cart
import UDPClient
import UDPTypes
  									
mainPos :: String -> IO ()
mainPos customer
    = do f       <- frame  [text := "Pizza-point-sales-order-system", resizeable := False]
         h       <- openlog "localhost" "1514" "Order"
         p       <- panel  f []
         nb      <- notebook p []
        -- textlog <- textCtrl p [enabled := False, wrap := WrapNone] 


       
         -- First Page (Main Page)
         pan1  <- panel  nb [] 
          
         
         --Second Page
         pan2   <- panel  nb []
         but21  <- bitmapButton pan2 [picture := "resource/forOrder.png"]
             
         txt21  <- staticText pan2 [ text := " Here is the order: ", fontSize := 15, fontUnderline:= False ]
         
         
         txt20  <- staticText pan2 [ text := "------------------------------------------------------------------------------"]
         txt22  <- staticText pan2 [ text := " Pizza Type ", fontSize := 12, fontUnderline:= False ]
         txt23  <- staticText pan2 [ text := " price ", fontSize := 12, fontUnderline:= False ]
         txt24  <- staticText pan2 [ text := " number ", fontSize := 12, fontUnderline:= False ]
         txt25  <- staticText pan2 [ text := " Total Price:     ",fontSize := 12, fontUnderline:= False]
         txt26  <- staticText pan2 [ text := "0",fontSize := 12]
         
         txt201  <- staticText pan2 [ text := " Pizza1 ", fontSize := 12, fontUnderline:= False ]
         txt202  <- staticText pan2 [ text := " Pizza2 ", fontSize := 12, fontUnderline:= False ]
         txt203  <- staticText pan2 [ text := " Pizza3 ", fontSize := 12, fontUnderline:= False ]
         txt204  <- staticText pan2 [ text := " Pizza4 ", fontSize := 12, fontUnderline:= False ]
         txt205  <- staticText pan2 [ text := " Pizza5 ", fontSize := 12, fontUnderline:= False ]
         txt206  <- staticText pan2 [ text := " Pizza6 ", fontSize := 12, fontUnderline:= False ]
         txt207  <- staticText pan2 [ text := " Pizza7 ", fontSize := 12, fontUnderline:= False ]
         txt208  <- staticText pan2 [ text := " Pizza8 ", fontSize := 12, fontUnderline:= False ]
         txt209  <- staticText pan2 [ text := " Pizza9 ", fontSize := 12, fontUnderline:= False ]
         
         txt211  <- staticText pan2 [ text := show (price !! 0), fontSize := 12, fontUnderline:= False ]
         txt212  <- staticText pan2 [ text := show (price !! 1), fontSize := 12, fontUnderline:= False ]
         txt213  <- staticText pan2 [ text := show (price !! 2), fontSize := 12, fontUnderline:= False ]
         txt214  <- staticText pan2 [ text := show (price !! 3), fontSize := 12, fontUnderline:= False ]
         txt215  <- staticText pan2 [ text := show (price !! 4), fontSize := 12, fontUnderline:= False ]
         txt216  <- staticText pan2 [ text := show (price !! 5), fontSize := 12, fontUnderline:= False ]
         txt217  <- staticText pan2 [ text := show (price !! 6), fontSize := 12, fontUnderline:= False ]
         txt218  <- staticText pan2 [ text := show (price !! 7), fontSize := 12, fontUnderline:= False ]
         txt219  <- staticText pan2 [ text := show (price !! 8), fontSize := 12, fontUnderline:= False ]
         
         txt221  <- staticText pan2 [ text := "0", fontSize := 12, fontUnderline:= False ]
         txt222  <- staticText pan2 [ text := "0", fontSize := 12, fontUnderline:= False ]
         txt223  <- staticText pan2 [ text := "0", fontSize := 12, fontUnderline:= False ]
         txt224  <- staticText pan2 [ text := "0", fontSize := 12, fontUnderline:= False ]
         txt225  <- staticText pan2 [ text := "0", fontSize := 12, fontUnderline:= False ]
         txt226  <- staticText pan2 [ text := "0", fontSize := 12, fontUnderline:= False ]
         txt227  <- staticText pan2 [ text := "0", fontSize := 12, fontUnderline:= False ]
         txt228  <- staticText pan2 [ text := "0", fontSize := 12, fontUnderline:= False ]
         txt229  <- staticText pan2 [ text := "0", fontSize := 12, fontUnderline:= False ]
         
         but1  <- bitmapButton pan1 [picture := "resource/pizza11.png",tooltip := "declious",on command := displayPizza f 1 txt221 txt26]
         but2  <- bitmapButton pan1 [picture := "resource/pizza12.png",tooltip := "declious",on command := displayPizza f 2 txt222 txt26]
         but3  <- bitmapButton pan1 [picture := "resource/pizza13.png",tooltip := "declious",on command := displayPizza f 3 txt223 txt26]
                                                                                                                                    
         but4  <- bitmapButton pan1 [picture := "resource/pizza14.png",tooltip := "declious",on command := displayPizza f 4 txt224 txt26]
         but5  <- bitmapButton pan1 [picture := "resource/pizza15.png",tooltip := "declious",on command := displayPizza f 5 txt225 txt26]
         but6  <- bitmapButton pan1 [picture := "resource/pizza16.png",tooltip := "declious",on command := displayPizza f 6 txt226 txt26]
                                                                                                                                   
         but7  <- bitmapButton pan1 [picture := "resource/pizza17.png",tooltip := "declious",on command := displayPizza f 7 txt227 txt26]
         but8  <- bitmapButton pan1 [picture := "resource/pizza18.png",tooltip := "declious",on command := displayPizza f 8 txt228 txt26]
         but9  <- bitmapButton pan1 [picture := "resource/pizza19.png",tooltip := "declious",on command := displayPizza f 9 txt229 txt26]
         
         but29  <- button pan2 [text := "buy now", fontSize := 12, fontUnderline:= False, on command := submitOrder customer f h  
                                                                                                                    txt201 txt202 txt203 txt204 txt205 txt206 txt207 txt208 txt209
                                                                                                                    txt211 txt212 txt213 txt214 txt215 txt216 txt217 txt218 txt219
                                                                                                                    txt221 txt222 txt223 txt224 txt225 txt226 txt227 txt228 txt229
                                                                                                                    txt26
         
                    ]
   -- infoDialog f "Submit Order" "Your order has been submietted, please wait..."  
         -- Third Page 
         pan3  <- panel  nb []
         txt30  <- staticText pan3 [text := "Haskell Program!"] 
         
         
         set f [  picture := "resource/main2.png"
                  ,layout := container p $  margin 2 $  
                           column 0  [ tabs nb
                                          [tab "MainPage" $
                                              container pan1 $ margin 10 $ floatCentre $ column 20 [ row 1 [ widget but1,widget but2,widget but3 ]
                                                                                                     ,row 2 [ widget but4,widget but5,widget but6 ]
                                                                                                     ,row 3 [ widget but7,widget but8,widget but9 ] ]
                                          ,tab "Shopping Cart" $
                                              container pan2 $ margin 10 $ floatCentre $ column 10 [  row 1 [widget but21]                                                              
                                                                                                     ,row 2 [widget txt21]
                                                                                                     ,row 3 [glue,widget txt20,glue]
                                                                                                     ,row 3 [glue,widget txt22, glue,widget txt23,glue,widget txt24,glue,glue,glue]
                                                                                                     ,row 4 [glue,widget txt201,glue,widget txt211,glue,widget txt221,glue,glue,glue]
                                                                                                     ,row 4 [glue,widget txt202,glue,widget txt212,glue,widget txt222,glue,glue,glue]
                                                                                                     ,row 4 [glue,widget txt203,glue,widget txt213,glue,widget txt223,glue,glue,glue]
                                                                                                     ,row 4 [glue,widget txt204,glue,widget txt214,glue,widget txt224,glue,glue,glue]
                                                                                                     ,row 4 [glue,widget txt205,glue,widget txt215,glue,widget txt225,glue,glue,glue]
                                                                                                     ,row 4 [glue,widget txt206,glue,widget txt216,glue,widget txt226,glue,glue,glue]
                                                                                                     ,row 4 [glue,widget txt207,glue,widget txt217,glue,widget txt227,glue,glue,glue]
                                                                                                     ,row 4 [glue,widget txt208,glue,widget txt218,glue,widget txt228,glue,glue,glue]
                                                                                                     ,row 4 [glue,widget txt209,glue,widget txt219,glue,widget txt229,glue,glue,glue]
                                                                                                     ,row 5 [glue,glue,glue,widget txt25,widget txt26,glue]
                                                                                                     ,row 9 [floatBottomRight $ widget but29] ]
                                                                                                   
                                          ,tab "About us" $ 
                                              container pan3 $ margin 10 $ floatCentre $ row 5 [widget txt30]
                                          ]
                                             --  container pan1 $ margin 10 $ floatCentre $ [ row 3 [ widget but1,widget but2,widget but3 ]
                                              --                                             ,row 5 [ widget but4,widget but5,widget but6 ]
                                              --                                             ,row 7 [ widget but7,widget but8,widget but9 ] ] 
                                          
                                     ] 
                  , clientSize := sz 400 600
                ]      
         return ()


submitOrder username f h t1  t2  t3  t4  t5  t6  t7  t8  t9
                         t11 t12 t13 t14 t15 t16 t17 t18 t19
                         t21 t22 t23 t24 t25 t26 t27 t28 t29
                         t
                           = do  totalprice <- get t text
                                 type1 <- get t1 text
                                 type2 <- get t2 text
                                 type3 <- get t2 text
                                 type4 <- get t3 text
                                 type5 <- get t4 text
                                 type6 <- get t5 text
                                 type7 <- get t6 text
                                 type8 <- get t7 text
                                 type9 <- get t8 text
                                 p1    <- get t11 text
                                 p2    <- get t12 text
                                 p3    <- get t13 text
                                 p4    <- get t14 text
                                 p5    <- get t15 text
                                 p6    <- get t16 text
                                 p7    <- get t17 text
                                 p8    <- get t18 text
                                 p9    <- get t19 text
                                 n1    <- get t21 text
                                 n2    <- get t22 text
                                 n3    <- get t23 text
                                 n4    <- get t24 text
                                 n5    <- get t25 text
                                 n6    <- get t26 text
                                 n7    <- get t27 text
                                 n8    <- get t28 text
                                 n9    <- get t29 text
                                 
                                 total <- get t text
                                 infoDialog f "Submit Order" "Your order has been submietted, please wait..." 
                                 syslog h USER INFO ("\nCustomer: " ++ username ++
                                                     "\nOrder:" ++"\n"++type1++" "++n1 ++"\n"++type2++" "++n2 
                                                                ++"\n"++type3++" "++n3 ++"\n"++type4++" "++n4
                                                                ++"\n"++type5++" "++n5 ++"\n"++type6++" "++n6
                                                                ++"\n"++type7++" "++n7 ++"\n"++type8++" "++n8
                                                                ++"\n"++type9++" "++n9
                                                                ++"\n             Total price is: "++total 
                                                    )
                                                              
                           

displayPizza:: Frame() -> Int -> StaticText() -> StaticText() -> IO()
displayPizza f0 n t1 t2 = do f     <- frame  [text := "Pizza-point-sales-order-system", resizeable := True]
                             p1    <- panel f[]
                             p2    <- panel f[]
                             p3    <- panel f[]
                             p4    <- panel f[]
                             p5    <- panel f[]
                             p6    <- panel f[]
                             p7    <- panel f[]
                             p8    <- panel f[]
                             p9    <- panel f[]
                             but1  <- bitmapButton p1 [picture := "resource/pizza11d.png"]
                             but2  <- bitmapButton p2 [picture := "resource/pizza12d.png"]
                             but3  <- bitmapButton p3 [picture := "resource/pizza13d.png"]
                             but4  <- bitmapButton p4 [picture := "resource/pizza14d.png"]
                             but5  <- bitmapButton p5 [picture := "resource/pizza15d.png"]
                             but6  <- bitmapButton p6 [picture := "resource/pizza16d.png"]
                             but7  <- bitmapButton p7 [picture := "resource/pizza17d.png"]
                             but8  <- bitmapButton p8 [picture := "resource/pizza18d.png"]
                             but9  <- bitmapButton p9 [picture := "resource/pizza19d.png"]
                               
                             
                             
                             txt111    <- staticText p1 [text := "The number you want:   ", fontWeight := WeightBold]
                             txt112    <- entry   p1 [text := "1"]
                             but113    <- bitmapButton p1 [picture := "resource/sub.png",  on command := subN txt112 ]
                             but114    <- bitmapButton p1 [picture := "resource/plus.png", on command := addN txt112 ]
                             
                             txt221    <- staticText   p2 [text := "The number you want:   ", fontWeight := WeightBold]
                             txt222    <- entry        p2 [text := "1"]
                             but223    <- bitmapButton p2 [picture := "resource/sub.png",  on command := subN txt222 ]
                             but224    <- bitmapButton p2 [picture := "resource/plus.png", on command := addN txt222 ]
                             
                             txt331    <- staticText   p3 [text := "The number you want:   ", fontWeight := WeightBold]
                             txt332    <- entry        p3 [text := "1"]
                             but333    <- bitmapButton p3 [picture := "resource/sub.png",  on command := subN txt332 ]
                             but334    <- bitmapButton p3 [picture := "resource/plus.png", on command := addN txt332 ]
                             
                             txt441    <- staticText   p4 [text := "The number you want:   ", fontWeight := WeightBold]
                             txt442    <- entry        p4 [text := "1"]
                             but443    <- bitmapButton p4 [picture := "resource/sub.png",  on command := subN txt442 ]
                             but444    <- bitmapButton p4 [picture := "resource/plus.png", on command := addN txt442 ] 
                             
                             txt551    <- staticText   p5 [text := "The number you want:   ", fontWeight := WeightBold]
                             txt552    <- entry        p5 [text := "1"]
                             but553    <- bitmapButton p5 [picture := "resource/sub.png",  on command := subN txt552 ]
                             but554    <- bitmapButton p5 [picture := "resource/plus.png", on command := addN txt552 ] 
                             
                             txt661    <- staticText   p6 [text := "The number you want:   ", fontWeight := WeightBold]
                             txt662    <- entry        p6 [text := "1"]
                             but663    <- bitmapButton p6 [picture := "resource/sub.png",  on command := subN txt662 ]
                             but664    <- bitmapButton p6 [picture := "resource/plus.png", on command := addN txt662 ] 
                             
                             txt771    <- staticText   p7 [text := "The number you want:   ", fontWeight := WeightBold]
                             txt772    <- entry        p7 [text := "1"]
                             but773    <- bitmapButton p7 [picture := "resource/sub.png",  on command := subN txt772 ]
                             but774    <- bitmapButton p7 [picture := "resource/plus.png", on command := addN txt772 ]
                             
                             txt881    <- staticText   p8 [text := "The number you want:   ", fontWeight := WeightBold]
                             txt882    <- entry        p8 [text := "1"]
                             but883    <- bitmapButton p8 [picture := "resource/sub.png",  on command := subN txt882 ]
                             but884    <- bitmapButton p8 [picture := "resource/plus.png", on command := addN txt882 ]
                             
                             txt991    <- staticText   p9 [text := "The number you want:   ", fontWeight := WeightBold]
                             txt992    <- entry        p9 [text := "1"]
                             but993    <- bitmapButton p9 [picture := "resource/sub.png",  on command := subN txt992 ]
                             but994    <- bitmapButton p9 [picture := "resource/plus.png", on command := addN txt992 ]
                              
                             but11    <- button p1 [ text := "Confirm", bgcolor:= red, on command := sendToCart f n txt112 t1 t2 ]
                             but12    <- button p2 [ text := "Confirm", bgcolor:= red, on command := sendToCart f n txt222 t1 t2 ]
                             but13    <- button p3 [ text := "Confirm", bgcolor:= red, on command := sendToCart f n txt332 t1 t2 ]
                             but14    <- button p4 [ text := "Confirm", bgcolor:= red, on command := sendToCart f n txt442 t1 t2 ]
                             but15    <- button p5 [ text := "Confirm", bgcolor:= red, on command := sendToCart f n txt552 t1 t2 ]
                             but16    <- button p6 [ text := "Confirm", bgcolor:= red, on command := sendToCart f n txt662 t1 t2 ]
                             but17    <- button p7 [ text := "Confirm", bgcolor:= red, on command := sendToCart f n txt772 t1 t2 ]
                             but18    <- button p8 [ text := "Confirm", bgcolor:= red, on command := sendToCart f n txt882 t1 t2 ]
                             but19    <- button p9 [ text := "Confirm", bgcolor:= red, on command := sendToCart f n txt992 t1 t2 ]
                             
                             
                             case n of 1 -> set f [ layout := container p1 $ column 30 [   widget but1
                                                                                          ,row 0 [glue,widget txt111,widget but113,widget txt112,widget but114]
                                                                                          ,floatBottomRight $ margin 10 $ widget but11] ]
                                       2 -> set f [ layout := container p2 $ column 30 [   widget but2
                                                                                          ,row 0 [glue,widget txt221,widget but223,widget txt222,widget but224]
                                                                                          ,floatBottomRight $ margin 10 $ widget but12] ]
                                       3 -> set f [ layout := container p3 $ column 30 [   widget but3
                                                                                          ,row 0 [glue,widget txt331,widget but333,widget txt332,widget but334]
                                                                                          ,floatBottomRight $ margin 10 $ widget but13] ]
                                       4 -> set f [ layout := container p4 $ column 30 [   widget but4
                                                                                          ,row 0 [glue,widget txt441,widget but443,widget txt442,widget but444]
                                                                                          ,floatBottomRight $ margin 10 $ widget but14] ]
                                       5 -> set f [ layout := container p5 $ column 30 [   widget but5
                                                                                          ,row 0 [glue,widget txt551,widget but553,widget txt552,widget but554]
                                                                                          ,floatBottomRight $ margin 10 $ widget but15] ]
                                       6 -> set f [ layout := container p6 $ column 30 [   widget but6
                                                                                          ,row 0 [glue,widget txt661,widget but663,widget txt662,widget but664]
                                                                                          ,floatBottomRight $ margin 10 $ widget but16] ]
                                       7 -> set f [ layout := container p7 $ column 30 [   widget but7
                                                                                          ,row 0 [glue,widget txt771,widget but773,widget txt772,widget but774]
                                                                                          ,floatBottomRight $ margin 10 $ widget but17] ]
                                       8 -> set f [ layout := container p8 $ column 30 [   widget but8
                                                                                          ,row 0 [glue,widget txt881,widget but883,widget txt882,widget but884]
                                                                                          ,floatBottomRight $ margin 10 $ widget but18] ]
                                       9 -> set f [ layout := container p9 $ column 30 [   widget but9
                                                                                          ,row 0 [glue,widget txt991,widget but993,widget txt992,widget but994]
                                                                                          ,floatBottomRight $ margin 10 $ widget but19] ]
                             return ()
                           
                 
subN::TextCtrl() -> IO()
subN t = do txt <- get t text
            set t [text := show (read txt - 1)]

addN::TextCtrl() -> IO()
addN t = do txt <- get t text
            set t [text := show (read txt + 1)]
            
sendToCart:: Frame() -> Int -> TextCtrl() -> StaticText() -> StaticText() -> IO()
sendToCart f n t1 t2 t = do txt1 <- get t1 text 
                            txt2 <- get t2 text 
                            tx   <- get t text
                            let num0 = read txt2 + 0
                            let num = read txt1 + 0
                            set t2 [ text:= show (num0 + num ) ]
                            let sum0 = read tx + 0
                            let total = sum0 + num*( price !! (n-1) )
                            set t [text:= show total ] 
                            close f
                                               

--handleInfo:: Frame() -> LocalOrder -> IO()   
--handleInfo f lo = do close f   

--showLocalOrder :: StaticText() -> IO()  
--showLocalOrder t = do set t [text := show pizza1num ]
--showLocalOrder t = do
--                      if(fst (head localOrder) == 1)    then set t [text := show ( snd (head localOrder) ) ]
--                                                        else set t [text := "0" ]          