
require("Card")


function Main()
	
	local self = CCScene:create()
	-- print("Main!!!!!!!!!!!!!")
	local layer
	local allPoints
	local allCards={}
	local currentNum

	--生成所有点
	local function  genPoints()

		allPoints = {}
		for i=0,9 do
			for j=0,5 do
				--把点添加到allPoints容器中
				table.insert(allPoints,1,ccp(i*80,j*80))
			end
		end
	end

	--添加卡片到当前的层中去
	local function  addCards()
		-- 建一个随机种子
		math.randomseed(os.time())

		local c
		local randNum

		for var=1,5 do
			c = Card(var)
			layer:addChild(c)

			-- table.maxn获得最大数字索引，从这个索引值下创建随机数
			randNum = math.random(table.maxn(allPoints))
			-- 把table中设置的这个删除掉
			p = table.remove(allPoints,randNum)
			--把这个位置设置给卡片
			c:setPosition(p)

			-- 把卡片添加到allCards容器中
			table.insert(allCards,1,c)
		end
	end

	-- 开始游戏
	local function startGame()
		currentNum = 1

		--生成所有可用的点
		genPoints()
		-- 添加卡片
		addCards()

		-- -- -- 添加卡片
		-- local c = Card(2)
		-- layer:addChild(c)

		-- -- 显示背景
		-- c:showBg()
	end

	-- 显示所有卡片背景
	local function showAllCardsBg()	
		for key,var in pairs(allCards) do
			var:showBg()
		end

	end

	-- 触摸时事件
	local function onTouch(type,x,y)
		local p = ccp(x,y)

		for key,var in pairs(allCards) do
			if var:boundingBox():containsPoint(p) then
				--如果触摸正确定
				if currentNum==var.num then
					--把卡片从allCards容器中移除掉
					table.remove(allCards,key)
					--并把卡片从层中移除
					layer:removeChild(var,true)

					if currentNum == 1 then
						showAllCardsBg()
					end

					--如果所有的点对了，就成功
					if table.maxn(allCards) <=0 then
						print("success")
					end
					currentNum = currentNum + 1
				end

				break
			end
		end
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

