
CoordMode, Pixel, Screen

ScreenWidth := 800
ScreenHeight := 585

halfWidth := ScreenWidth/2
halfHeight := ScreenHeight/2

Images1 := "perfect.png"
Images2 := "flawless.png"
Images3 := "unique.png"
Images8 := "gold.bmp"
Images7 := "setitem.png"
Images6 := "elmag.png"
Images5 := "elixir.png"
Images4 := "crafted.png"
ImagesCount = 8

Failed := 500
Success := 1337
Searching := 1




Hotkey, !z,TheMover,On
Hotkey, !x,TheMovymover,On
Hotkey, 5,ToCube,On
Hotkey, +5,Transmute,On
HotKey, Space, TransferSide, On

Pause::Suspend
return



TransferSide:

MouseGetPos, xpos, ypos
Click, xpos, ypos, Left
Sleep, 100

if (xpos > halfWidth) ;from invo
{
	if (FindAndClick( xpos2, ypos2, 50, 60, halfWidth, 560, "emptystash.png") = 1)
	{
		MouseMove %xpos%, %ypos%, 0
	}
	else
	{
		Click, xpos, ypos, Left
	}
}
else ;;;;;;;;;;;;;from stash/cube/merchant
{
	if (FindAndClick( xpos2, ypos2, halfWidth, 60, 800, 560, "emptyinvo.png") = 1)
	{
		MouseMove %xpos%, %ypos%, 0
	}
	else
	{
		Click, xpos, ypos, Left
	}
}


return


Transmute:

if (FindAndClick( xpos2, ypos2, 50,200, 400, 560, "transmute.png") = 1)
{
	Click, 370 290 Left
}
else
{
	MouseGetPos, xpos, ypos
	
	if (FindAndClickDir(xpos2, ypos2, 0, 0, 800, 560, "cube.png", "Right") = 1)
	{
		Sleep, 100
		if (FindAndClick( xpos2, ypos2, 50,200, 400, 560, "transmute.png") = 1)
		{
			Click, 370 290 Left
			Click, 370 460 Left
			
			MouseMove %xpos%, %ypos%, 0
		}
	}
}

return

ToCube:

MouseGetPos, xpos, ypos
Click, %xpos% %ypos% Left 1
Sleep, 100

if (FindAndClick( xpos2, ypos2, 0, 0, 800, 560, "cube.png") = 1)
{
	MouseMove %xpos%, %ypos%, 0
}


return


TheMover:

Gosub, FindAllImages

return


TheMovymover:

Loop
{
	LastPx := 0
	LastPy := 0
	found := 0
	Gosub, FindAllImages
	
	if (found = 1)
	{
		LastPx := abs(abs(LastPx - halfWidth) - 50)
		LastPy := abs(abs(LastPy - halfHeight) - 50)
		
		Together := Ceil(Sqrt(LastPx * LastPx + LastPy * LastPy)) * 1000 / 500
		
		
		
		Sleep, % Together
	}
	else 
	{
		return
	}
}

return



FindAllImages:

found := 0

Loop %ImagesCount%
{
	if (FindAndClick( Px, Py, 340, 200, 460, 330, Images%A_Index%) = 1)
	{
		LastPx := Px
		LastPy := Py
		found := 1
		return 
	}
}

Loop %ImagesCount%
{
	if (FindAndClick( Px, Py, 10, 90, 800, 553, Images%A_Index%) = 1)
	{
		LastPx := Px
		LastPy := Py
		found := 1
		return 
	}
}

return 

FindAndClick(ByRef Px, ByRef Py, x1, y1, x2, y2, image)
{
	return FindAndClickDir(Px, Py, x1, y1,  x2, y2, image, "Left")
}

FindAndClickDir(ByRef Px, ByRef Py, x1, y1, x2, y2, image, LeftRight)
{
	ImageSearch, Px, Py, x1, y1, x2, y2, *1 *TransBlack %image%
	
	if ErrorLevel
	{
		return 0
	}
	else
	{
		Click, %Px% %Py% %LeftRight% 1	
		return 1
	}
}

LWin::
send {Alt}
return
