
require("Card")


function Main()
	
	local self = CCScene:create()
	-- print("Main!!!!!!!!!!!!!")
	local layer


	-- 开始游戏
	local function startGame()
		--添加卡片
		local c = Card(2)
		layer:addChild(c)

		-- 显示背景
		c:showBg()
	end

	-- 触摸时事件
	local function onTouch()
		
	end

	local  function init(  )
		layer = CCLayer:create()
		self:addChild(layer)

		layer:setTouchEnabled(true)
		layer:registerScriptTouchHandler(onTouch)

		startGame()

		-- local  s = CCSprite:create("mn.jpg")
		-- s:setPosition(ccp(300,300))
		-- layer:addChild(s)

		-- -- 添加触摸事件处理
		-- layer:setTouchEnabled(true)
		-- layer:registerScriptTouchHandler(function ( type,x,y )
			

		-- 	if s:boundingBox():containsPoint(ccp(x,y)) then
		-- 		print("mn clicked!!")
		-- 	end

		-- 	-- print(type)
		-- 	-- return true
		-- end)
	end 

	init()
	return self
end


-- 主程序
local  function __main()
	CCEGLView:sharedOpenGLView():setDesignResolutionSize(800,480,kResolutionShowAll)
	
	-- 不显示游戏帧频
	local dir = CCDirector:sharedDirector()
	dir:setDisplayStats(false)

    dir:runWithScene(Main())
end 

__main()

