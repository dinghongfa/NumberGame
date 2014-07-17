
function Main()
	
	local self = CCScene:create()
	print("Main!!!!!!!!!!!!!")
	local layer
	local  function init(  )
		layer = CCLayer:create()
		self:addChild(layer)

		local  s = CCSprite:create("mn.jpg")
		s:setPosition(ccp(300,300))
		layer:addChild(s)
	end 
	init()
	return self
end


local  function __main()
	CCEGLView:sharedOpenGLView():setDesignResolutionSize(800,480,kResolutionShowAll)
    CCDirector:sharedDirector():runWithScene(Main())
end 

__main()