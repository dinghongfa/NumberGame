-- 游戏结束


function GameOver()
	local self = CCScene:create()
	local layer

	local function menuCallBack()
		local scene = Game()
    	CCDirector:sharedDirector():replaceScene(TransitionFadeDown:create(0.5,scene))
	end

	local function init()
		-- 把图层添加到场景中
		layer = CCLayer:create()
		self:addChild(layer)

		-- 获得屏幕大小  
  		local s = CCDirector:sharedDirector():getWinSize()

		--游戏结束文字
		local gameOverLabel = CCLabelTTF:create("You Are Success!","Courier",50)
		gameOverLabel:setPosition(ccp(s.width/2,s.height/2))
		layer:addChild(gameOverLabel)

		-- 创建MenuItem
		local restartLabel = CCLabelTTF:create("Restart Game","Courier",30)
		local restartItem = CCMenuItemLabel:create(restartLabel)
		-- CCMenuItem:registerScriptTapHandler(menuCallBack)
 		restartLabel:setAnchorPoint(ccp(0.5, 0.5)) 
		restartItem:setPosition(ccp(s.width/2,s.height/2-50))

  		--创建一个菜单
		local menu = CCMenu:create()
        menu:addChild(restartItem)
		menu:setPosition(0,0)
		layer:addChild(menu)

	end
	init()

	return self
end