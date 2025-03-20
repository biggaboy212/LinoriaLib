--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    RIOT V2

    This file was built with DarkLua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b={}b.ProtectGui=function(c)
local d=cloneref and cloneref(game)or game local e,f=pcall(function()c.Parent=
gethui and gethui()or cloneref and cloneref(d:GetService'CoreGui')or d:
GetService'CoreGui'end)return e and c or error('Failed to protect GUI: '..
tostring(f))end b.ProtectGui=newcclosure and newcclosure(b.ProtectGui)or b.
ProtectGui b.SecureService=function(c)local d=cloneref and cloneref(game)or game
local e,f=pcall(function()return cloneref and cloneref(d:GetService(c))or d:
GetService(c)end)return e and f or error('Unable to retrieve service: '..c)end b
.SecureService=newcclosure and newcclosure(b.SecureService)or b.SecureService
function b.GetPlayer()local c,d=pcall(function()return(b.SecureService'Players')
end)return c and(d).LocalPlayer or nil end function b.GetCharacter(c)local d,e=
pcall(function()return c and c.Character or nil end)return d and e or nil end
function b.GetHumanoid(c)local d,e=pcall(function()local d=b.GetCharacter(c)
return d and d:FindFirstChildOfClass'Humanoid'or nil end)return d and e or nil
end return b end function a.b()local b={}b.GetUI=function()return loadstring(
game:HttpGetAsync
[[https://raw.githubusercontent.com/biggaboy212/LinoriaLib/refs/heads/main/Library.lua]]
)()end b.GetSaveManager=function()return loadstring(game:HttpGetAsync
[[https://raw.githubusercontent.com/biggaboy212/LinoriaLib/refs/heads/main/addons/SaveManager.lua]]
)()end b.GetThemeManager=function()local c,d=game:GetService'HttpService',{}do d
.Folder='LinoriaLibSettings'd.Library=nil d.BuiltInThemes={Default={1,c:
JSONDecode
[[{"FontColor":"ffffff","MainColor":"1c1c1c","AccentColor":"81b8e6","BackgroundColor":"141414","OutlineColor":"323232"}]]
},BBot={2,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"7e48a3","BackgroundColor":"232323","OutlineColor":"141414"}]]
},Fatality={3,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"3c355d"}]]
},Jester={4,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"242424","AccentColor":"db4467","BackgroundColor":"1c1c1c","OutlineColor":"373737"}]]
},Mint={5,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"242424","AccentColor":"3db488","BackgroundColor":"1c1c1c","OutlineColor":"373737"}]]
},['Tokyo Night']={6,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"191925","AccentColor":"6759b3","BackgroundColor":"16161f","OutlineColor":"323232"}]]
},Ubuntu={7,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"3e3e3e","AccentColor":"e2581e","BackgroundColor":"323232","OutlineColor":"191919"}]]
},Quartz={8,c:JSONDecode
[[{"FontColor":"ffffff","MainColor":"232330","AccentColor":"426e87","BackgroundColor":"1d1b26","OutlineColor":"27232f"}]]
}}function d:ApplyTheme(e)local f=self:GetCustomTheme(e)local g=f or self.
BuiltInThemes[e]if not g then return end local h=g[2]for i,j in next,f or h do
self.Library[i]=Color3.fromHex(j)if Options[i]then Options[i]:SetValueRGB(Color3
.fromHex(j))end end self:ThemeUpdate()end function d:ThemeUpdate()local e={
'FontColor','MainColor','AccentColor','BackgroundColor','OutlineColor'}for f,g
in next,e do if Options and Options[g]then self.Library[g]=Options[g].Value end
end self.Library.AccentColorDark=self.Library:GetDarkerColor(self.Library.
AccentColor)self.Library:UpdateColorsUsingRegistry()end function d:LoadDefault()
local e,f,g='Default',isfile(self.Folder..'/themes/default.txt')and readfile(
self.Folder..'/themes/default.txt'),true if f then if self.BuiltInThemes[f]then
e=f elseif self:GetCustomTheme(f)then e=f g=false end elseif self.BuiltInThemes[
self.DefaultTheme]then e=self.DefaultTheme end if g then Options.
ThemeManager_ThemeList:SetValue(e)else self:ApplyTheme(e)end end function d:
SaveDefault(e)writefile(self.Folder..'/themes/default.txt',e)end function d:
CreateThemeManager(e)e:AddLabel'Background color':AddColorPicker(
'BackgroundColor',{Default=self.Library.BackgroundColor})e:AddLabel'Main color':
AddColorPicker('MainColor',{Default=self.Library.MainColor})e:AddLabel
'Accent color':AddColorPicker('AccentColor',{Default=self.Library.AccentColor})e
:AddLabel'Outline color':AddColorPicker('OutlineColor',{Default=self.Library.
OutlineColor})e:AddLabel'Font color':AddColorPicker('FontColor',{Default=self.
Library.FontColor})local f={}for g,h in next,self.BuiltInThemes do table.insert(
f,g)end table.sort(f,function(i,j)return self.BuiltInThemes[i][1]<self.
BuiltInThemes[j][1]end)e:AddDivider()e:AddDropdown('ThemeManager_ThemeList',{
Text='Theme list',Values=f,Default=1})e:AddButton('Set as default',function()
self:SaveDefault(Options.ThemeManager_ThemeList.Value)self.Library:Notify(string
.format('Set default theme to %q',Options.ThemeManager_ThemeList.Value))end)
Options.ThemeManager_ThemeList:OnChanged(function()self:ApplyTheme(Options.
ThemeManager_ThemeList.Value)end)e:AddDivider()e:AddInput(
'ThemeManager_CustomThemeName',{Text='Custom theme name'})e:AddDropdown(
'ThemeManager_CustomThemeList',{Text='Custom themes',Values=self:
ReloadCustomThemes(),AllowNull=true,Default=1})e:AddDivider()e:AddButton(
'Save theme',function()self:SaveCustomTheme(Options.ThemeManager_CustomThemeName
.Value)Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
Options.ThemeManager_CustomThemeList:SetValue(nil)end):AddButton('Load theme',
function()self:ApplyTheme(Options.ThemeManager_CustomThemeList.Value)end)e:
AddButton('Refresh list',function()Options.ThemeManager_CustomThemeList:
SetValues(self:ReloadCustomThemes())Options.ThemeManager_CustomThemeList:
SetValue(nil)end)e:AddButton('Set as default',function()if Options.
ThemeManager_CustomThemeList.Value~=nil and Options.ThemeManager_CustomThemeList
.Value~=''then self:SaveDefault(Options.ThemeManager_CustomThemeList.Value)self.
Library:Notify(string.format('Set default theme to %q',Options.
ThemeManager_CustomThemeList.Value))end end)d:LoadDefault()local i=function()
self:ThemeUpdate()end Options.BackgroundColor:OnChanged(i)Options.MainColor:
OnChanged(i)Options.AccentColor:OnChanged(i)Options.OutlineColor:OnChanged(i)
Options.FontColor:OnChanged(i)end function d:GetCustomTheme(e)local f=self.
Folder..'/themes/'..e if not isfile(f)then return nil end local g=readfile(f)
local h,i=pcall(c.JSONDecode,c,g)if not h then return nil end return i end
function d:SaveCustomTheme(e)if e:gsub(' ','')==''then return self.Library:
Notify('Invalid file name for theme (empty)',3)end local f,g={},{'FontColor',
'MainColor','AccentColor','BackgroundColor','OutlineColor'}for h,i in next,g do
f[i]=Options[i].Value:ToHex()end writefile(self.Folder..'/themes/'..e..'.json',c
:JSONEncode(f))end function d:ReloadCustomThemes()local e,f=listfiles(self.
Folder..'/themes'),{}for g=1,#e do local h=e[g]if h:sub(-5)=='.json'then local i
=h:find('.json',1,true)local j=h:sub(i,i)while j~='/'and j~='\\'and j~=''do i=i-
1 j=h:sub(i,i)end if j=='/'or j=='\\'then table.insert(f,h:sub(i+1))end end end
return f end function d:SetLibrary(e)self.Library=e end function d:
BuildFolderTree()local e,f={},self.Folder:split'/'for g=1,#f do e[#e+1]=table.
concat(f,'/',1,g)end table.insert(e,self.Folder..'/themes')table.insert(e,self.
Folder..'/settings')for g=1,#e do local h=e[g]if not isfolder(h)then makefolder(
h)end end end function d:SetFolder(e)self.Folder=e self:BuildFolderTree()end
function d:CreateGroupBox(e)assert(self.Library,
'Must set ThemeManager.Library first!')return e:AddLeftGroupbox'Themes'end
function d:ApplyToTab(e)assert(self.Library,
'Must set ThemeManager.Library first!')local f=self:CreateGroupBox(e)self:
CreateThemeManager(f)end function d:ApplyToGroupbox(e)assert(self.Library,
'Must set ThemeManager.Library first!')self:CreateThemeManager(e)end d:
BuildFolderTree()end return d end return b end function a.c()local b=a.load'a'.
SecureService local c,d,e,f,g=b'RunService',b'Players',b'Workspace',b
'UserInputService',b'CoreGui'local h,i=d.LocalPlayer,e.CurrentCamera local j,k,l
,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K=i.ViewportSize,math.floor,
math.round,math.sin,math.cos,table.clear,table.unpack,table.find,table.create,
CFrame.fromMatrix,i.WorldToViewportPoint,e.IsA,e.GetPivot,e.FindFirstChild,e.
FindFirstChildOfClass,e.GetChildren,CFrame.identity.PointToObjectSpace,Color3.
new().Lerp,Vector2.zero.Min,Vector2.zero.Max,Vector2.zero.Lerp,Vector3.zero.Min,
Vector3.zero.Max,Vector2.new(7,0),Vector2.new(0,1),Vector2.new(0,2),Vector2.new(
5,0),{Vector3.new(-1,-1,-1),Vector3.new(-1,1,-1),Vector3.new(-1,1,1),Vector3.
new(-1,-1,1),Vector3.new(1,-1,-1),Vector3.new(1,1,-1),Vector3.new(1,1,1),Vector3
.new(1,-1,1)}local L,M=function(L)local M,N for O=1,#L do local P=L[O]local Q,R=
P.CFrame,P.Size M=E(M or Q.Position,(Q-R*0.5).Position)N=F(N or Q.Position,(Q+R*
0.5).Position)end local O=(M+N)*0.5 local P=Vector3.new(O.X,O.Y,N.Z)return
CFrame.new(O,P),N-M end,function(L)local M,N=t(i,L)return Vector2.new(M.X,M.Y),N
,M.Z end local N,O,P,Q=function(N,O)local P=r(#K)for Q=1,#K do P[Q]=M((N+O*0.5*K
[Q]).Position)end local Q,R=B(j,p(P)),C(Vector2.zero,p(P))return{corners=P,
topLeft=Vector2.new(k(Q.X),k(Q.Y)),topRight=Vector2.new(k(R.X),k(Q.Y)),
bottomLeft=Vector2.new(k(Q.X),k(R.Y)),bottomRight=Vector2.new(k(R.X),k(R.Y))}end
,function(N,O)local P,Q,R,S=N.X,N.Y,n(O),m(O)return Vector2.new(P*R-Q*S,P*S+Q*R)
end,function(N,O,P)if O=='Team Color'or(N.interface.shared.useTeamColor and not
P)then return N.interface.getTeamColor(N.player)or Color3.new(1,1,1)end return O
end,{}Q.__index=Q function Q.new(R,S)local T=setmetatable({},Q)T.player=assert(R
,'Missing argument #1 (Player expected)')T.interface=assert(S,
'Missing argument #2 (table expected)')T:Construct()return T end function Q:
_create(R,S)local T=Drawing.new(R)for U,V in next,S do pcall(function()T[U]=V
end)end self.bin[#self.bin+1]=T return T end function Q:Construct()self.
charCache={}self.childCount=0 self.bin={}self.drawings={box3d={{self:_create(
'Line',{Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,Visible=
false}),self:_create('Line',{Thickness=1,Visible=false})},{self:_create('Line',{
Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,Visible=false}),
self:_create('Line',{Thickness=1,Visible=false})},{self:_create('Line',{
Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,Visible=false}),
self:_create('Line',{Thickness=1,Visible=false})},{self:_create('Line',{
Thickness=1,Visible=false}),self:_create('Line',{Thickness=1,Visible=false}),
self:_create('Line',{Thickness=1,Visible=false})}},visible={tracerOutline=self:
_create('Line',{Thickness=2,Visible=false}),tracer=self:_create('Line',{
Thickness=1,Visible=false}),boxFill=self:_create('Square',{Filled=true,Visible=
false}),boxOutline=self:_create('Square',{Thickness=2,Visible=false}),box=self:
_create('Square',{Thickness=1,Visible=false}),healthBarOutline=self:_create(
'Line',{Thickness=6,Visible=false}),healthBar=self:_create('Line',{Thickness=4,
Visible=false}),healthText=self:_create('Text',{Center=true,Visible=false}),name
=self:_create('Text',{Text=string.upper(self.player.DisplayName),Center=true,
Visible=false}),distance=self:_create('Text',{Center=true,Visible=false}),weapon
=self:_create('Text',{Center=true,Visible=false})},hidden={arrowOutline=self:
_create('Triangle',{Thickness=3,Visible=false}),arrow=self:_create('Triangle',{
Filled=true,Visible=false})}}self.renderConnection=c.RenderStepped:Connect(
function(R)self:Update(R)self:Render(R)end)end function Q:Destruct()self.
renderConnection:Disconnect()for R=1,#self.bin do self.bin[R]:Remove()end o(self
)end function Q:Update()local R=self.interface self.options=R.team[R.isFriendly(
self.player)and'friendly'or'enemy']self.character=R.getCharacter(self.player)
self.health,self.maxHealth=R.getHealth(self.player)self.weapon=R.getWeapon(self.
player)self.enabled=self.options.enabled and self.character and not(#R.whitelist
>0 and not q(R.whitelist,self.player.UserId))local S=self.enabled and w(self.
character,'Head')if not S then self.charCache={}self.onScreen=false return end
local T,U,V=M(S.Position)self.onScreen=U self.distance=V if R.shared.
limitDistance and V>R.shared.maxDistance then self.onScreen=false end if self.
onScreen then local W,X=self.charCache,y(self.character)if not W[1]or self.
childCount~=#X then o(W)for Y=1,#X do local Z=X[Y]if u(Z,'BasePart')and R.
isBodyPart(Z.Name)then W[#W+1]=Z end end self.childCount=#X end self.corners=N(
L(W))elseif self.options.offScreenArrow then local W=i.CFrame local X=s(W.
Position,W.RightVector,Vector3.yAxis)local Y=z(X,S.Position)self.direction=
Vector2.new(Y.X,Y.Z).Unit end end function Q:Render()local R,S,T,U,V,W,X,Y=self.
onScreen or false,self.enabled or false,self.drawings.visible,self.drawings.
hidden,self.drawings.box3d,self.interface,self.options,self.corners T.box.
Visible=S and R and X.box T.boxOutline.Visible=T.box.Visible and X.boxOutline if
T.box.Visible then local Z=T.box Z.Position=Y.topLeft Z.Size=Y.bottomRight-Y.
topLeft Z.Color=P(self,X.boxColor[1])Z.Transparency=X.boxColor[2]local _=T.
boxOutline _.Position=Z.Position _.Size=Z.Size _.Color=P(self,X.boxOutlineColor[
1],true)_.Transparency=X.boxOutlineColor[2]end T.boxFill.Visible=S and R and X.
boxFill if T.boxFill.Visible then local Z=T.boxFill Z.Position=Y.topLeft Z.Size=
Y.bottomRight-Y.topLeft Z.Color=P(self,X.boxFillColor[1])Z.Transparency=X.
boxFillColor[2]end T.healthBar.Visible=S and R and X.healthBar T.
healthBarOutline.Visible=T.healthBar.Visible and X.healthBarOutline if T.
healthBar.Visible then local Z,_,aa=Y.topLeft-G,Y.bottomLeft-G,T.healthBar aa.To
=_ aa.From=D(_,Z,self.health/self.maxHealth)aa.Color=A(X.dyingColor,X.
healthyColor,self.health/self.maxHealth)local ab=T.healthBarOutline ab.To=_+H ab
.From=Z-H ab.Color=P(self,X.healthBarOutlineColor[1],true)ab.Transparency=X.
healthBarOutlineColor[2]end T.name.Visible=S and R and X.name if T.name.Visible
then local aa=T.name aa.Size=W.shared.textSize aa.Font=W.shared.textFont aa.
Color=P(self,X.nameColor[1])aa.Transparency=X.nameColor[2]aa.Outline=X.
nameOutline aa.OutlineColor=P(self,X.nameOutlineColor,true)aa.Position=(Y.
topLeft+Y.topRight)*0.5-Vector2.yAxis*aa.TextBounds.Y-I end local aa=Y and Y.
topRight.Y or 0 T.distance.Visible=S and R and self.distance and X.distance if T
.distance.Visible then local ab=T.distance ab.Text=l(self.distance*0.28)..'M'ab.
Size=W.shared.textSize ab.Font=W.shared.textFont ab.Color=P(self,X.distanceColor
[1])ab.Transparency=X.distanceColor[2]ab.Outline=X.distanceOutline ab.
OutlineColor=P(self,X.distanceOutlineColor,true)ab.Position=Vector2.new(Y.
topRight.X+J.X+ab.TextBounds.X*0.5,aa-ab.TextBounds.Y*0.5-J.Y)aa=aa+ab.
TextBounds.Y+J.Y end T.weapon.Visible=S and R and X.weapon if T.weapon.Visible
then local ab=T.weapon ab.Text=self.weapon ab.Size=W.shared.textSize ab.Font=W.
shared.textFont ab.Color=P(self,X.weaponColor[1])ab.Transparency=X.weaponColor[2
]ab.Outline=X.weaponOutline ab.OutlineColor=P(self,X.weaponOutlineColor,true)ab.
Position=Vector2.new(Y.topRight.X+J.X+ab.TextBounds.X*0.5,aa-ab.TextBounds.Y*0.5
)aa=aa+ab.TextBounds.Y+J.Y end T.healthText.Visible=S and R and X.healthText if
T.healthText.Visible then local ab=T.healthText ab.Text=l(self.health)..'HP'ab.
Size=W.shared.textSize ab.Font=W.shared.textFont ab.Color=P(self,X.
healthTextColor[1])ab.Transparency=X.healthTextColor[2]ab.Outline=X.
healthTextOutline ab.OutlineColor=P(self,X.healthTextOutlineColor,true)ab.
Position=Vector2.new(Y.topRight.X+J.X+ab.TextBounds.X*0.5,aa-ab.TextBounds.Y*0.5
)end T.tracer.Visible=S and R and X.tracer T.tracerOutline.Visible=T.tracer.
Visible and X.tracerOutline if T.tracer.Visible then local ab=T.tracer ab.Color=
P(self,X.tracerColor[1])ab.Transparency=X.tracerColor[2]ab.To=(Y.bottomLeft+Y.
bottomRight)*0.5 ab.From=X.tracerOrigin=='Middle'and j*0.5 or X.tracerOrigin==
'Top'and j*Vector2.new(0.5,0)or X.tracerOrigin=='Bottom'and j*Vector2.new(0.5,1)
or X.tracerOrigin=='Mouse'and f:GetMouseLocation()local Z=T.tracerOutline Z.
Color=P(self,X.tracerOutlineColor[1],true)Z.Transparency=X.tracerOutlineColor[2]
Z.To=ab.To Z.From=ab.From end U.arrow.Visible=S and(not R)and X.offScreenArrow U
.arrowOutline.Visible=U.arrow.Visible and X.offScreenArrowOutline if U.arrow.
Visible and self.direction then local ab=U.arrow ab.PointA=B(C(j*0.5+self.
direction*X.offScreenArrowRadius,Vector2.one*25),j-Vector2.one*25)ab.PointB=ab.
PointA-O(self.direction,0.45)*X.offScreenArrowSize ab.PointC=ab.PointA-O(self.
direction,-0.45)*X.offScreenArrowSize ab.Color=P(self,X.offScreenArrowColor[1])
ab.Transparency=X.offScreenArrowColor[2]local Z=U.arrowOutline Z.PointA=ab.
PointA Z.PointB=ab.PointB Z.PointC=ab.PointC Z.Color=P(self,X.
offScreenArrowOutlineColor[1],true)Z.Transparency=X.offScreenArrowOutlineColor[2
]end local ab=S and R and X.box3d for Z=1,#V do local _=V[Z]for ac=1,#_ do local
ad=_[ac]ad.Visible=ab ad.Color=P(self,X.box3dColor[1])ad.Transparency=X.
box3dColor[2]end if ab then local ac=_[1]ac.From=Y.corners[Z]ac.To=Y.corners[Z==
4 and 1 or Z+1]local ad=_[2]ad.From=Y.corners[Z==4 and 1 or Z+1]ad.To=Y.corners[
Z==4 and 5 or Z+5]local ae=_[3]ae.From=Y.corners[Z==4 and 5 or Z+5]ae.To=Y.
corners[Z==4 and 8 or Z+4]end end end local aa={}aa.__index=aa function aa.new(
ab,ac)local ad=setmetatable({},aa)ad.player=assert(ab,
'Missing argument #1 (Player expected)')ad.interface=assert(ac,
'Missing argument #2 (table expected)')ad:Construct()return ad end function aa:
Construct()self.highlight=Instance.new('Highlight',g)self.updateConnection=c.
RenderStepped:Connect(function()self:Update()end)end function aa:Destruct()self.
updateConnection:Disconnect()self.highlight:Destroy()o(self)end function aa:
Update()local ab,ac=self.highlight,self.interface local ad,ae=ac.getCharacter(
self.player),ac.team[ac.isFriendly(self.player)and'friendly'or'enemy']local R=ae
.enabled and ad and not(#ac.whitelist>0 and not q(ac.whitelist,self.player.
UserId))ab.Enabled=R and ae.chams if ab.Enabled then ab.Adornee=ad ab.FillColor=
P(self,ae.chamsFillColor[1])ab.FillTransparency=ae.chamsFillColor[2]ab.
OutlineColor=P(self,ae.chamsOutlineColor[1],true)ab.OutlineTransparency=ae.
chamsOutlineColor[2]ab.DepthMode=ae.chamsVisibleOnly and'Occluded'or
'AlwaysOnTop'end end local ab={}ab.__index=ab function ab.new(ac,ad)local ae=
setmetatable({},ab)ae.instance=assert(ac,
'Missing argument #1 (Instance Expected)')ae.options=assert(ad,
'Missing argument #2 (table expected)')ae:Construct()return ae end function ab:
Construct()local ac=self.options ac.enabled=ac.enabled==nil and true or ac.
enabled ac.text=ac.text or'{name}'ac.textColor=ac.textColor or{Color3.new(1,1,1)
,1}ac.textOutline=ac.textOutline==nil and true or ac.textOutline ac.
textOutlineColor=ac.textOutlineColor or Color3.new()ac.textSize=ac.textSize or
13 ac.textFont=ac.textFont or 2 ac.limitDistance=ac.limitDistance or false ac.
maxDistance=ac.maxDistance or 150 self.text=Drawing.new'Text'self.text.Center=
true self.renderConnection=c.Stepped:Connect(function(ad)self:Render(ad)end)end
function ab:Destruct()self.renderConnection:Disconnect()self.text:Remove()end
function ab:Render()local ac=self.instance if not ac or not ac.Parent then
return self:Destruct()end local ad,ae=self.text,self.options if not ae.enabled
then ad.Visible=false return end local R=v(ac).Position local S,T,U=M(R)if ae.
limitDistance and U>ae.maxDistance then T=false end ad.Visible=T if ad.Visible
then ad.Position=S ad.Color=ae.textColor[1]ad.Transparency=ae.textColor[2]ad.
Outline=ae.textOutline ad.OutlineColor=ae.textOutlineColor ad.Size=ae.textSize
ad.Font=ae.textFont ad.Text=ae.text:gsub('{name}',string.upper(ac.Name)):gsub(
'{distance}',l(U*0.28)..'M'):gsub('{position}',string.upper(tostring(R)))end
return nil end local ac={_hasLoaded=false,_objectCache={},whitelist={},shared={
textSize=13,textFont=4,limitDistance=false,maxDistance=150,useTeamColor=false,
includeLocalPlayer=false},team={enemy={enabled=false,box=false,boxColor={Color3.
new(1,0,0),1},boxOutline=true,boxOutlineColor={Color3.new(),1},boxFill=false,
boxFillColor={Color3.new(1,0,0),0.5},healthBar=false,healthyColor=Color3.
fromRGB(58,161,47),dyingColor=Color3.fromRGB(161,47,47),healthBarOutline=true,
healthBarOutlineColor={Color3.new(),0.5},healthText=false,healthTextColor={
Color3.new(1,1,1),1},healthTextOutline=true,healthTextOutlineColor=Color3.new(),
box3d=false,box3dColor={Color3.new(1,0,0),1},name=false,nameColor={Color3.new(1,
1,1),1},nameOutline=true,nameOutlineColor=Color3.new(),weapon=false,weaponColor=
{Color3.new(1,1,1),1},weaponOutline=true,weaponOutlineColor=Color3.new(),
distance=false,distanceColor={Color3.new(1,1,1),1},distanceOutline=true,
distanceOutlineColor=Color3.new(),tracer=false,tracerOrigin='Bottom',tracerColor
={Color3.new(1,0,0),1},tracerOutline=true,tracerOutlineColor={Color3.new(),1},
offScreenArrow=false,offScreenArrowColor={Color3.new(1,1,1),1},
offScreenArrowSize=15,offScreenArrowRadius=150,offScreenArrowOutline=true,
offScreenArrowOutlineColor={Color3.new(),1},chams=false,chamsVisibleOnly=false,
chamsFillColor={Color3.new(0.2,0.2,0.2),0.5},chamsOutlineColor={Color3.new(1,0,0
),0}},friendly={enabled=false,box=false,boxColor={Color3.new(0,1,0),1},
boxOutline=true,boxOutlineColor={Color3.new(),1},boxFill=false,boxFillColor={
Color3.new(0,1,0),0.5},healthBar=false,healthyColor=Color3.new(0,1,0),dyingColor
=Color3.new(1,0,0),healthBarOutline=true,healthBarOutlineColor={Color3.new(),0.5
},healthText=false,healthTextColor={Color3.new(1,1,1),1},healthTextOutline=true,
healthTextOutlineColor=Color3.new(),box3d=false,box3dColor={Color3.new(0,1,0),1}
,name=false,nameColor={Color3.new(1,1,1),1},nameOutline=true,nameOutlineColor=
Color3.new(),weapon=false,weaponColor={Color3.new(1,1,1),1},weaponOutline=true,
weaponOutlineColor=Color3.new(),distance=false,distanceColor={Color3.new(1,1,1),
1},distanceOutline=true,distanceOutlineColor=Color3.new(),tracer=false,
tracerOrigin='Bottom',tracerColor={Color3.new(0,1,0),1},tracerOutline=true,
tracerOutlineColor={Color3.new(),1},offScreenArrow=false,offScreenArrowColor={
Color3.new(1,1,1),1},offScreenArrowSize=15,offScreenArrowRadius=150,
offScreenArrowOutline=true,offScreenArrowOutlineColor={Color3.new(),1},chams=
false,chamsVisibleOnly=false,chamsFillColor={Color3.new(0.2,0.2,0.2),0.5},
chamsOutlineColor={Color3.new(0,1,0),0}}}}function ac.AddInstance(ad,ae)local R=
ac._objectCache if R[ad]then warn'Instance handler already exists.'else R[ad]={
ab.new(ad,ae)}end return R[ad][1]end function ac.Load()assert(not ac._hasLoaded,
'Esp has already been loaded.')local ad,ae,R=function(ad)ac._objectCache[ad]={Q.
new(ad,ac),aa.new(ad,ac)}end,function(ad)local ae=ac._objectCache[ad]if ae then
for R=1,#ae do ae[R]:Destruct()end ac._objectCache[ad]=nil end end,d:GetPlayers(
)for S=ac.shared.includeLocalPlayer and 1 or 2,#R do ad(R[S])end ac.playerAdded=
d.PlayerAdded:Connect(ad)ac.playerRemoving=d.PlayerRemoving:Connect(ae)ac.
_hasLoaded=true end function ac.Unload()assert(ac._hasLoaded,
'Esp has not been loaded yet.')for ad,ae in next,ac._objectCache do for R=1,#ae
do ae[R]:Destruct()end ac._objectCache[ad]=nil end ac.playerAdded:Disconnect()ac
.playerRemoving:Disconnect()ac._hasLoaded=false end function ac.getWeapon(ad)
local ae='None'if ad and ad.Character then local R=ad.Character:
FindFirstChildOfClass'Tool'if R then ae=R.Name end end return string.upper(ae)
end function ac.isFriendly(ad)return ad.Team and ad.Team==h.Team end function ac
.getTeamColor(ad)return ad.Team and ad.Team.TeamColor and ad.Team.TeamColor.
Color end function ac.getCharacter(ad)return ad.Character end function ac.
isBodyPart(ad)return ad=='Head'or ad:find'Torso'or ad:find'Leg'or ad:find'Arm'
end function ac.getHealth(ad)local ae=ad and ac.getCharacter(ad)local R=ae and
x(ae,'Humanoid')if R then return R.Health,R.MaxHealth end return 100,100 end
return ac end function a.d()local aa,ab,ac,ad,ae,b,c,d,e,f,g,h,i,j=game,
workspace,Vector2.new,Vector3.zero,CFrame.new,Color3.fromRGB,Drawing.new,
TweenInfo.new,mousemoverel or(Input and Input.MouseMove),table.find,table.remove
,string.lower,string.sub,math.clamp local k=getrawmetatable and getrawmetatable(
aa)or{__index=function(k,l)return k[l]end,__newindex=function(k,l,m)k[l]=m end}
local l,m=k.__index,k.__newindex local n=l(aa,'GetService')local o,p,q,r=n(aa,
'RunService'),n(aa,'UserInputService'),n(aa,'TweenService'),n(aa,'Players')local
s,t,u,v,w=l(r,'LocalPlayer'),l(ab,'CurrentCamera'),l(aa,'FindFirstChild'),l(aa,
'FindFirstChildOfClass'),l(aa,'GetDescendants')local x,y,z,A,B,C,D,E,F,G,H,I=l(t
,'WorldToViewportPoint'),l(t,'GetPartsObscuringTarget'),l(p,'GetMouseLocation'),
l(r,'GetPlayers'),2000,false,{},l(aa,'DescendantAdded').Connect,{
DeveloperSettings={UpdateMode='RenderStepped',TeamCheckOption='Team'},Triggerbot
={Enabled=false,TeamCheck=true,AliveCheck=true,WeaponCheck=true,Delay=0,
TargetChanged=function(x)return end},Aimbot={Enabled=false,LockMode=2,LockPart=
'Head',TeamCheck=true,AliveCheck=true,WallCheck=1,Sensitivity=0,Sensitivity2=3.5
,OffsetToMoveDirection=false,OffsetIncrement=15,AutoStateLabel=function(x)return
end,AutoLockedLabel=function(x)return end},FOVSettings={Enabled=false,Visible=
true,Radius=90,NumSides=60,Thickness=2,Transparency=1,Filled=false,Color=b(255,
255,255),OutlineColor=b(0,0,0),LockedColor=b(255,150,150)},Blacklisted={},
FOVCircleOutline=c'Circle',FOVCircle=c'Circle'}local J,K,L=F,function(J)local K
for L,M in next,A(r)do local N=l(M,'Name')if i(h(N),1,#J)==h(J)then K=N end end
return K end,function(J)return ac(J.X,J.Y)end local M=function()J.Locked=nil
local M=J.FOVCircle M.Color=J.FOVSettings.Color m(p,'MouseDeltaSensitivity',H)if
G then G:Cancel()end J.Aimbot.AutoLockedLabel(nil)end F.Aimbot.SetState=function
(N)C=N if not N then M()end end local af,ag=function()local N=J.Aimbot local O=N
.LockPart if not J.Locked then B=J.FOVSettings.Enabled and J.FOVSettings.Radius
or 2000 for P,Q in next,A(r)do local R=l(Q,'Character')local S=R and v(R,
'Humanoid')if Q~=s and not f(J.Blacklisted,l(Q,'Name'))and R and u(R,O)and S
then local T,U=l(R[O],'Position'),J.DeveloperSettings.TeamCheckOption if N.
TeamCheck and l(Q,U)and l(Q,U)==l(s,U)then continue end if N.AliveCheck and l(S,
'Health')<=0 then continue end if N.WallCheck==2 or N.WallCheck==3 then local V=
w(l(s,'Character'))for W,X in next,w(R)do V[#V+1]=X end if#y(t,{T},V)>0 then
continue end end local V,W,X=x(t,T)V=L(V)X=(z(p)-V).Magnitude if X<B and W then
B,J.Locked=X,Q N.AutoLockedLabel(Q)end end end else local P=l(J.Locked,
'Character')if P then local Q=u(P,O)if not Q then M()return end local R=l(P[O],
'Position')local S,T=x(t,R)S=L(S)local U=(z(p)-S).Magnitude if N.WallCheck==3
then local V=w(l(s,'Character'))for W,X in next,w(P)do V[#V+1]=X end if#y(t,{R},
V)>0 then M()return end end if(U>B or not T)then M()end else M()end end end,
function()local N=J.Triggerbot if not N.Enabled then N.TargetChanged()return end
local O=l(s,'GetMouse')and s:GetMouse()if not O then N.TargetChanged()return end
local P=ab.CurrentCamera local Q,R,S=Ray.new(P.CFrame.Position,(O.Hit.Position-P
.CFrame.Position).Unit*1000),{s.Character,P},RaycastParams.new()S.
FilterDescendantsInstances=R S.FilterType=Enum.RaycastFilterType.Blacklist local
T=ab:Raycast(Q.Origin,Q.Direction,S)if not T then N.TargetChanged()return end
local U=T.Instance local V=U:FindFirstAncestorOfClass'Model'if not V then N.
TargetChanged()return end local W,X={},false for Y,Z in pairs(V:GetChildren())do
if Z.Name=='Head'or Z.Name:find'Torso'or Z.Name:find'Leg'or Z.Name:find'Arm'then
table.insert(W,Z)end end X=table.find(W,U)or U:IsDescendantOf(table.find(W,U))if
not X then N.TargetChanged()return end local _=r:GetPlayerFromCharacter(V)if not
_ or _==s then N.TargetChanged()return end local af=J.DeveloperSettings.
TeamCheckOption if N.TeamCheck and l(_,af)and l(_,af)==l(s,af)then N.
TargetChanged()return end if N.AliveCheck then local ag=v(V,'Humanoid')if l(ag,
'Health')<=0 then N.TargetChanged()return end end N.TargetChanged(_)task.wait(N.
Delay)mouse1press()task.wait()mouse1release()end local N=function()H=l(p,
'MouseDeltaSensitivity')local N,O,P,Q,R,S=J.Aimbot,J.Triggerbot,J.FOVCircle,J.
FOVCircleOutline,(J.FOVSettings)D.RenderSteppedConnection=E(l(o,J.
DeveloperSettings.UpdateMode),function()local T,U=N.OffsetToMoveDirection,N.
LockPart if R.Enabled and N.Enabled then P.Color=(J.Locked and R.LockedColor)or
R.Color Q.Color=R.OutlineColor P.Thickness=R.Thickness Q.Thickness=R.Thickness+1
P.Position=z(p)Q.Position=z(p)P.NumSides=R.NumSides Q.NumSides=R.NumSides P.
Radius=R.Radius Q.Radius=R.Radius P.Transparency=1-R.Transparency Q.Transparency
=1-R.Transparency P.Visible=R.Visible Q.Visible=R.Visible else P.Visible=false Q
.Visible=false end if O.Enabled then ag()end if C and N.Enabled then af()S=T and
l(v(l(J.Locked,'Character'),'Humanoid'),'MoveDirection')*(j(N.OffsetIncrement,1,
30)/10)or ad if J.Locked then local V=l(l(J.Locked,'Character')[U],'Position')
local W=x(t,V+S)local X,Y=(W.X-z(p).X)/N.Sensitivity2,(W.Y-z(p).Y)/N.
Sensitivity2 if J.Aimbot.LockMode==2 then e(X,Y)else if N.Sensitivity>0 then G=q
:Create(t,d(J.Aimbot.Sensitivity,Enum.EasingStyle.Sine,Enum.EasingDirection.Out)
,{CFrame=ae(t.CFrame.Position,V+S)})G:Play()else m(t,'CFrame',ae(t.CFrame.
Position,V+S))end end end end end)end function J.Exit(O)assert(O,
'Aimbot.Exit: Missing parameter #1 "self" <table>.')for P,Q in next,D do I(D[P])
end N=nil L=nil M=nil af=nil K=nil O.FOVCircle:Remove()O.FOVCircleOutline:
Remove()end function J.Restart()for O,P in next,D do I(D[O])end N()end function
J.Blacklist(O,P)assert(O,
'Aimbot.Blacklist: Missing parameter #1 "self" <table>.')assert(P,
'Aimbot.Blacklist: Missing parameter #2 "Username" <string>.')P=K(P)assert(O,
'Aimbot.Blacklist: User '..P.." couldn't be found.")O.Blacklisted[#O.Blacklisted
+1]=P end function J.Whitelist(O,P)assert(O,
'Aimbot.Whitelist: Missing parameter #1 "self" <table>.')assert(P,
'Aimbot.Whitelist: Missing parameter #2 "Username" <string>.')P=K(P)assert(P,
'Aimbot.Whitelist: User '..P.." couldn't be found.")local Q=f(O.Blacklisted,P)
assert(Q,'Aimbot.Whitelist: User '..P..' is not blacklisted.')g(O.Blacklisted,Q)
end function J.GetClosestPlayer()af()local O=J.Locked M()return O end J.Load=N
setmetatable(J,{__call=N})return J end function a.e()return function(aa)local ab
,ac=a.load'a',a.load'b'local ad,ae,af,ag,b,c,d=ac.GetUI(),ac.GetSaveManager(),ac
.GetThemeManager(),a.load'c',a.load'd',getgenv().Options,getgenv().Toggles local
e,f=ag.shared,ag.team local g,h,i,j,k,l=f.enemy,f.friendly,b.Aimbot,b.Triggerbot
,b.FOVSettings,ab.SecureService local m,n,o=l'Stats',l'RunService',ad:
CreateWindow{Title=`RIOT V2 | {aa.Name} - getriot.cc`,Center=true,AutoShow=true,
TabPadding=5,MenuFadeTime=0.1}local p={Combat=o:AddTab'Combat',Visuals=o:AddTab
'Visuals',Settings=o:AddTab'Settings'}do local q={Aimbot=p.Combat:AddGroupbox{
Side=1,Name='Aimbot'}}q.Aimbot:AddToggle('AimbotEnabled',{Text='Enabled',Default
=false}):AddKeyPicker('AimbotEnabledKeybind',{Default='MB2',Mode='Hold',Text=
'Aimbot',NoUI=false,Callback=function(r)if not d.AimbotEnabled.Value then return
end print'a'i:SetState(r)end})end do local q={Menu=p.Settings:AddGroupbox{Side=1
,Name='Menu'}}q.Menu:AddButton('Unload',function()ad:Unload()end)q.Menu:AddLabel
'Menu bind':AddKeyPicker('MenuKeybind',{Default='End',NoUI=true,Text=
'Menu keybind'})end local q,r,s=tick(),0,60 local t=n.RenderStepped:Connect(
function()r+=1 if(tick()-q)>=1 then s=r q=tick()r=0 end ad:SetWatermark(`RIOT V2 | framerate: {
math.floor(s)} fps | rtt: {math.round(m.Network.ServerStatsItem['Data Ping']:
GetValue())}ms`)end)ag.Load()b.Load()ad.KeybindFrame.Visible=true ad.
ToggleKeybind=c.MenuKeybind ad:SetWatermarkVisibility(true)af:SetLibrary(ad)ae:
SetLibrary(ad)ae:IgnoreThemeSettings()ae:SetIgnoreIndexes{'MenuKeybind'}af:
SetFolder(`RIOTV2`)ae:SetFolder(`RIOTV2/{aa.Name}`)ae:BuildConfigSection(p.
Settings)af:ApplyToTab(p.Settings)ae:LoadAutoloadConfig()ad:OnUnload(function()t
:Disconnect()end)end end function a.f()local aa={Version='1.3.2',Author='Depso',
License='MIT',Repository='https://github.com/depthso/Dear-ReGui/',Debug=false,
PrefabsId=117781589903262,DefaultTitle='ReGui',ContainerName='riUi',
DoubleClickThreshold=0.3,Container=nil,Prefabs=nil,Tooltip=nil,ActiveWindow=nil,
ThemeConfigs={},Elements={},Animation={DefaultTweenInfo=TweenInfo.new(0.08)},
_FlagCache={},Windows={},AnimationConnections={},MouseEvents={DoubleClick={},
Click={}}}aa.Icons={RDefaultImage='rbxassetid://134552883719543',RShieldCheck=
'rbxassetid://72905476505849',RShield='rbxassetid://125424227377940',RArchive=
'rbxassetid://86530498402003',RFolder='rbxassetid://134156031333431',RBolt=
'rbxassetid://99791134265440',RGlobe='rbxassetid://132856339478739',RComputer=
'rbxassetid://136037119434947',RSettings='rbxassetid://71732494649961',Dot=
'rbxasset://textures/whiteCircle.png',Arrow='rbxassetid://4731371527',Close=
'rbxasset://textures/AnimationEditor/icon_close.png',Checkmark=
'rbxasset://textures/AnimationEditor/icon_checkmark.png',Cat=
'rbxassetid://16211812161',Script='rbxassetid://11570895459',Settings=
'rbxassetid://9743465390',Info='rbxassetid://18754976792',Move=
'rbxassetid://6710235139',Roblox='rbxassetid://7414445494',Warning=
'rbxassetid://11745872910',Audio='rbxassetid://302250236',Shop=
'rbxassetid://6473525198',CharacterDance='rbxassetid://11932783331',Pants=
'rbxassetid://10098755331',Home='rbxassetid://4034483344',Robux=
'rbxassetid://5986143282',Badge='rbxassetid://16170504068',SpawnLocation=
'rbxassetid://6400507398',Sword='rbxassetid://7485051715',Clover=
'rbxassetid://11999300014',Star='rbxassetid://3057073083',Code=
'rbxassetid://11348555035',Paw='rbxassetid://13001190533',Shield=
'rbxassetid://7461510428',Shield2='rbxassetid://7169354142',File=
'rbxassetid://7276823330',Book='rbxassetid://16061686835',Location=
'rbxassetid://13549782519',Puzzle='rbxassetid://8898417863',Discord=
'rbxassetid://84828491431270',Premium='rbxassetid://6487178625',Friend=
'rbxassetid://10885655986',User='rbxassetid://18854794412',Duplicate=
'rbxassetid://11833749507',ChatBox='rbxassetid://15839118471',ChatBox2=
'rbxassetid://15839116089',Devices='rbxassetid://4458812712',Weight=
'rbxassetid://9855685269',Image='rbxassetid://4669770840',Profile=
'rbxassetid://13585614795',Admin='rbxassetid://11656483170',PaintBrush=
'rbxassetid://12111879608',Speed='rbxassetid://12641434961',NoConnection=
'rbxassetid://9795340967',Connection='rbxassetid://119759670842477',Globe=
'rbxassetid://18870359747',Box='rbxassetid://140217940575618',Crown=
'rbxassetid://18826490498',Control='rbxassetid://18979524646',Send=
'rbxassetid://18940312887',FastForward='rbxassetid://112963221295680',Pause=
'rbxassetid://109949100737970',Reload='rbxassetid://11570018242',Joystick=
'rbxassetid://18749336354',Controller='rbxassetid://11894535915',Lock=
'rbxassetid://17783082088',Calculator='rbxassetid://85861816563977',Sun=
'rbxassetid://13492317832',Moon='rbxassetid://8498174594',Prohibited=
'rbxassetid://5248916036',Flag='rbxassetid://251346532',Website=
'rbxassetid://98455290625865',Telegram='rbxassetid://115860270107061',MusicNote=
'rbxassetid://18187351229',Music='rbxassetid://253830398',Headphones=
'rbxassetid://1311321471',Phone='rbxassetid://8411963035',Smartphone=
'rbxassetid://14040313879',Desktop='rbxassetid://3120635703',Desktop2=
'rbxassetid://4728059490',Laptop='rbxassetid://4728059725',Server=
'rbxassetid://9692125126',Wedge='rbxassetid://9086583059',Drill=
'rbxassetid://11959189471',Character='rbxassetid://13285102351'}aa.Accent={Light
=Color3.fromRGB(50,150,250),Dark=Color3.fromRGB(30,66,115),White=Color3.fromRGB(
240,240,240),Gray=Color3.fromRGB(127,126,129),Black=Color3.fromRGB(15,19,24),
Yellow=Color3.fromRGB(230,180,0),Orange=Color3.fromRGB(230,150,0),Green=Color3.
fromRGB(130,188,91),Red=Color3.fromRGB(255,69,69),ImGui={Light=Color3.fromRGB(66
,150,250),Dark=Color3.fromRGB(41,74,122),Black=Color3.fromRGB(15,15,15),Gray=
Color3.fromRGB(36,36,36)}}local ab=aa.ThemeConfigs ab.DarkTheme={Values={
AnimationTweenInfo=TweenInfo.new(0.08),TextFont=Font.fromName'Inconsolata',
TextSize=13,Text=aa.Accent.White,TextDisabled=aa.Accent.Gray,ErrorText=aa.Accent
.Red,FrameBg=aa.Accent.Dark,FrameBgTransparency=0.4,FrameBgActive=aa.Accent.
Light,FrameBgTransparencyActive=0.4,SliderGrab=aa.Accent.Light,ButtonsBg=aa.
Accent.Light,CollapsingHeaderBg=aa.Accent.Light,CollapsingHeaderText=aa.Accent.
White,CheckMark=aa.Accent.Light,RadioButtonHoveredBg=aa.Accent.Light,ResizeGrab=
aa.Accent.Light,HeaderBg=aa.Accent.Gray,HeaderBgTransparency=0.6,HistogramBar=aa
.Accent.Yellow,ProgressBar=aa.Accent.Yellow,RegionBg=aa.Accent.Dark,
RegionBgTransparency=0.1,Separator=aa.Accent.Gray,SeparatorTransparency=0.5,
TabTextPaddingTop=UDim.new(0,3),TabTextPaddingBottom=UDim.new(0,8),TabText=aa.
Accent.Gray,TabBg=aa.Accent.Dark,TabTextActive=aa.Accent.White,TabBgActive=aa.
Accent.Light,TabsBarBg=Color3.fromRGB(36,36,36),TabsBarBgTransparency=1,
TabPadding=UDim.new(0,8),ModalWindowDimBg=Color3.fromRGB(230,230,230),
ModalWindowDimTweenInfo=TweenInfo.new(0.2),WindowBg=aa.Accent.Black,
WindowBgTransparency=0.05,Border=aa.Accent.Gray,BorderTransparency=0.7,
BorderTransparencyActive=0.4,Title=aa.Accent.White,TitleAlign=Enum.
TextXAlignment.Left,TitleBarBg=aa.Accent.Black,TitleBarTransparency=0,
TitleActive=aa.Accent.White,TitleBarBgActive=aa.Accent.Dark,
TitleBarTransparencyActive=0.05,TitleBarBgCollapsed=Color3.fromRGB(0,0,0),
TitleBarTransparencyCollapsed=0.6}}ab.LightTheme={BaseTheme=ab.DarkTheme,Values=
{Text=aa.Accent.Black,TextFont=Font.fromName'Ubuntu',TextSize=14,FrameBg=aa.
Accent.Gray,FrameBgTransparency=0.4,FrameBgActive=aa.Accent.Gray,
FrameBgTransparencyActive=0,SliderGrab=aa.Accent.White,ButtonsBg=aa.Accent.Gray,
CollapsingHeaderBg=aa.Accent.Gray,CollapsingHeaderText=aa.Accent.Black,CheckMark
=aa.Accent.Black,RadioButtonHoveredBg=aa.Accent.Black,Separator=aa.Accent.Black,
TabText=aa.Accent.Black,TabBg=aa.Accent.White,TabTextActive=aa.Accent.Black,
TabBgActive=aa.Accent.Gray,WindowBg=aa.Accent.White,Border=aa.Accent.Gray,
ResizeGrab=aa.Accent.Gray,Title=aa.Accent.White,TitleAlign=Enum.TextXAlignment.
Center,TitleBarBg=aa.Accent.Black,TitleActive=aa.Accent.Black,TitleBarBgActive=
aa.Accent.Gray}}ab.Classic={BaseTheme=ab.DarkTheme,Values={AnimationTweenInfo=
TweenInfo.new(0),Text=Color3.fromRGB(255,255,255),FrameBg=aa.Accent.ImGui.Dark,
FrameBgTransparency=0.4,FrameBgActive=aa.Accent.ImGui.Light,
FrameBgTransparencyActive=0.5,ButtonsBg=aa.Accent.ImGui.Light,CollapsingHeaderBg
=aa.Accent.ImGui.Light,CollapsingHeaderText=aa.Accent.White,CheckMark=aa.Accent.
ImGui.Light,RadioButtonHoveredBg=aa.Accent.ImGui.Light,ResizeGrab=aa.Accent.
ImGui.Light,TabTextPaddingTop=UDim.new(0,0),TabText=aa.Accent.Gray,TabBg=aa.
Accent.ImGui.Gray,TabTextActive=aa.Accent.White,TabBgActive=aa.Accent.ImGui.Gray
,TabsBarBg=aa.Accent.ImGui.Gray,TabsBarBgTransparency=0,WindowBg=aa.Accent.ImGui
.Black,WindowBgTransparency=0.05,Border=aa.Accent.Gray,BorderTransparency=0.7,
BorderTransparencyActive=0.4,Title=aa.Accent.White,TitleBarBg=aa.Accent.ImGui.
Black,TitleBarTransparency=0,TitleBarBgActive=aa.Accent.ImGui.Dark,
TitleBarTransparencyActive=0}}aa.ElementColors={ModalWindowDim={BackgroundColor3
='ModalWindowDimBg'},Selectable={BackgroundColor3='ButtonsBg',FontFace=
'TextFont',TextSize='TextSize'},Separator={BackgroundColor3='Separator',
BackgroundTransparency='SeparatorTransparency'},Region={BackgroundColor3=
'RegionBg',BackgroundTransparency='RegionBgTransparency'},Label={TextColor3=
'Text',FontFace='TextFont',TextSize='TextSize'},ConsoleText={TextColor3='Text',
FontFace='TextFont',TextSize='TextSize'},LabelDisabled={TextColor3=
'TextDisabled',FontFace='TextFont',TextSize='TextSize'},Plot={BackgroundColor3=
'HistogramBar'},Header={BackgroundColor3='HeaderBg',BackgroundTransparency=
'HeaderBgTransparency'},WindowTitle={TextXAlignment='TitleAlign',FontFace=
'TextFont',TextSize='TextSize'},TitleBar={BackgroundColor3='TitleBarBgActive'},
Window={BackgroundColor3='WindowBg',BackgroundTransparency=
'WindowBgTransparency'},TitleBarBgCollapsed={BackgroundColor3=
'TitleBarBgCollapsed',BackgroundTransparency='TitleBarTransparencyCollapsed'},
TitleBarBgActive={BackgroundColor3='TitleBarBgActive',BackgroundTransparency=
'TitleBarTransparencyActive'},TitleBarBg={BackgroundColor3='TitleBarBg',
BackgroundTransparency='TitleBarTransparency'},TabSelectorTabsBar={
BackgroundColor3='TabsBarBg',BackgroundTransparency='TabsBarBgTransparency'},
Border={Color='Border',Transparency='BorderTransparency'},ResizeGrab={TextColor3
='ResizeGrab'},BorderActive={Transparency='BorderTransparencyActive'},Frame={
BackgroundColor3='FrameBg',BackgroundTransparency='FrameBgTransparency',
TextColor3='Text',FontFace='TextFont',TextSize='TextSize'},FrameActive={
BackgroundColor3='FrameBgActive',BackgroundTransparency=
'FrameBgTransparencyActive'},SliderGrab={BackgroundColor3='SliderGrab'},Button={
BackgroundColor3='ButtonsBg',TextColor3='Text',FontFace='TextFont',TextSize=
'TextSize'},CollapsingHeader={FontFace='TextFont',TextSize='TextSize',TextColor3
='CollapsingHeaderText',BackgroundColor3='CollapsingHeaderBg'},Checkbox={
BackgroundColor3='FrameBg'},CheckMark={ImageColor3='CheckMark',BackgroundColor3=
'CheckMark'},RadioButton={BackgroundColor3='RadioButtonHoveredBg'}}aa.Styles={
RadioButton={Animation='RadioButtons',CornerRadius=UDim.new(1,0)},Button={
Animation='Buttons'},CollapsingHeader={Animation='Buttons'},TreeNode={Animation=
'TransparentButtons'},TransparentButton={Animation='TransparentButtons'}}aa.
Animations={Invisible={Connections={MouseEnter={Visible=true},MouseLeave={
Visible=false}},Init='MouseLeave'},Buttons={Connections={MouseEnter={
BackgroundTransparency=0.3},MouseLeave={BackgroundTransparency=0.7}},Init=
'MouseLeave'},TextButtons={Connections={MouseEnter={TextTransparency=0.3},
MouseLeave={TextTransparency=0.7}},Init='MouseLeave'},TransparentButtons={
Connections={MouseEnter={BackgroundTransparency=0.3},MouseLeave={
BackgroundTransparency=1}},Init='MouseLeave'},RadioButtons={Connections={
MouseEnter={BackgroundTransparency=0.5},MouseLeave={BackgroundTransparency=1}},
Init='MouseLeave'},Inputs={Connections={MouseEnter={BackgroundTransparency=0},
MouseLeave={BackgroundTransparency=0.5}},Init='MouseLeave'},Plots={Connections={
MouseEnter={BackgroundTransparency=0.3},MouseLeave={BackgroundTransparency=0}},
Init='MouseLeave'},Border={Connections={Selected={Transparency=0,Thickness=1},
Deselected={Transparency=0.7,Thickness=1}},Init='Selected'}}aa.ElementFlags={{
Properties={'Center'},Callback=function(ac,ad,ae)local af=ad.Position aa:
SetProperties(ad,{Position=UDim2.new(ae:find'X'and 0.5 or af.X.Scale,af.X.Offset
,ae:find'Y'and 0.5 or af.Y.Scale,af.Y.Offset),AnchorPoint=Vector2.new(ae:find'X'
and 0.5 or 0,ae:find'Y'and 0.5 or 0)})end},{Properties={'ElementStyle'},Callback
=function(ac,ad,ae)aa:ApplyStyle(ad,ae)end},{Properties={'ColorTag'},Callback=
function(ac,ad,ae)local af,ag=ac.Class,ac.WindowClass local b=af.NoAutoTheme if
not ag then return end if b then return end aa:UpdateColors{Object=ad,Tag=ae,
NoAnimation=true,Theme=ag.Theme}end},{Properties={'Animation'},Callback=function
(ac,ad,ae)local af=ac.Class.NoAnimation if af then return end aa:SetAnimation(ad
,ae)end},{Properties={'Icon','IconSize','IconRotation'},Callback=function(ac,ad,
ae)local af=ad:FindFirstChild('Icon',true)if not af then return aa:Warn(
'No icon for',ad)end local ag=ac.Class aa:CheckConfig(ag,{Icon='',IconSize=UDim2
.fromScale(1,1),IconRotation=0})local b,c,d=ag.IconSize,ag.Icon,ag.IconRotation
c=aa:CheckAssetUrl(c)aa:SetProperties(af,{Visible=ae and true,Image=c,Size=b,
Rotation=d})end},{Properties={'BorderThickness','Border','BorderColor'},Callback
=function(ac,ad,ae)local af=ac.Class local ag=af.Border==true aa:CheckConfig(af,
{BorderThickness=ag and 1 or 0,BorderStrokeMode=Enum.ApplyStrokeMode.Border})
local b=aa:GetChildOfClass(ad,'UIStroke')aa:SetProperties(b,{Thickness=af.
BorderThickness,Color=af.BorderColor,ApplyStrokeMode=af.BorderStrokeMode,Enabled
=ag})end},{Properties={'Ratio'},Callback=function(ac,ad,ae)local af=ac.Class aa:
CheckConfig(af,{Ratio=1.3333333333333333,RatioAxis=Enum.DominantAxis.Height,
RatioAspectType=Enum.AspectType.ScaleWithParentSize})local ag,b,c,d=af.Ratio,af.
RatioAxis,af.RatioAspectType,aa:GetChildOfClass(ad,'UIAspectRatioConstraint')aa:
SetProperties(d,{DominantAxis=b,AspectType=c,AspectRatio=ag})end},{Properties={
'FlexMode'},Callback=function(ac,ad,ae)local af=aa:GetChildOfClass(ad,
'UIFlexItem')af.FlexMode=ae end},{Properties={'CornerRadius'},Callback=function(
ac,ad,ae)local af=aa:GetChildOfClass(ad,'UICorner')af.CornerRadius=ae end},{
Properties={'Fill'},Callback=function(ac,ad,ae)if ae~=true then return end local
af=ac.Class aa:CheckConfig(af,{Size=UDim2.fromScale(1,1),UIFlexMode=Enum.
UIFlexMode.Fill,AutomaticSize=Enum.AutomaticSize.None})local ag=aa:
GetChildOfClass(ad,'UIFlexItem')ag.FlexMode=af.UIFlexMode ad.Size=af.Size ad.
AutomaticSize=af.AutomaticSize end},{Properties={'Label'},Callback=function(ac,
ad,ae)local af=ad:FindFirstChild'Label'if not af then return end local ag=ac.
Class function ag:SetLabel(b)af.Text=b return self end af.Text=tostring(ae)end},
{Properties={'NoGradient'},WindowProperties={'NoGradients'},Callback=function(ac
,ad,ae)local af=ad:FindFirstChildOfClass'UIGradient'if not af then return end af
.Enabled=ae end},{Properties={'UiPadding','PaddingBottom','PaddingTop',
'PaddingRight','PaddingTop'},Callback=function(ac,ad,ae)ae=ae or 0 if typeof(ae)
=='number'then ae=UDim.new(0,ae)end local af=ac.Class local ag=af.UiPadding if
ag then aa:CheckConfig(af,{PaddingBottom=ae,PaddingLeft=ae,PaddingRight=ae,
PaddingTop=ae})end local b=aa:GetChildOfClass(ad,'UIPadding')aa:SetProperties(b,
{PaddingBottom=af.PaddingBottom,PaddingLeft=af.PaddingLeft,PaddingRight=af.
PaddingRight,PaddingTop=af.PaddingTop})end},{Properties={'Callback'},Callback=
function(ac,ad)local ae=ac.Class function ae:SetCallback(af)self.Callback=af
return self end function ae:FireCallback(af)self.Callback(ad)return self end end
},{Properties={'Value'},Callback=function(ac,ad)local ae=ac.Class aa:
CheckConfig(ae,{GetValue=function(af)return ae.Value end})end}}local ac,ad,ae=
function()end,get_hidden_gui or gethui,cloneref or function(ac)return ac end
local af=setmetatable({},{__index=function(af,ag)local b=game:GetService(ag)
return ae(b)end})local ag,b,c,d=af.Players,af.CoreGui,af.UserInputService,af.
TweenService local e=ag.LocalPlayer aa.PlayerGui=e.PlayerGui aa.Mouse=e:
GetMouse()local f=aa.Animation function f:Tween(g)local h,i,j=self.
DefaultTweenInfo,g.Object,g.NoAnimation local k,l,m,n=g.Tweeninfo or h,g.
EndProperties,g.StartProperties,g.Completed if m then aa:SetProperties(i,m)end
if j then aa:SetProperties(i,l)if n then n()end return end local o for p,q in
next,l do local r={[p]=q}local s,t=pcall(function()return d:Create(i,k,r)end)if
not s then aa:SetProperties(i,r)continue end if not o then o=t end t:Play()end
if n then if o then o.Completed:Connect(n)else n()end end return o end function
f:Animate(g)local h,i,j,k,l=g.NoAnimation,g.Objects,g.Tweeninfo,(g.Completed)for
m,n in next,i do local o=self:Tween{NoAnimation=h,Object=m,Tweeninfo=j,
EndProperties=n}if not l then l=o end end if k then l.Completed:Connect(k)end
return l end function f:HeaderCollapseToggle(g)aa:CheckConfig(g,{Rotations={Open
=90,Closed=0}})local h,i,j,k,l=g.Toggle,g.NoAnimation,g.Rotations,g.Collapsed,g.
Tweeninfo local m=k and j.Closed or j.Open self:Tween{Tweeninfo=l,NoAnimation=i,
Object=h,EndProperties={Rotation=m}}end function f:HeaderCollapse(g)local h,i,j,
k,l,m,n,o,p,q,r=g.Tweeninfo,g.Collapsed,g.ClosedSize,g.OpenSize,g.Toggle,g.
Resize,g.Hide,g.NoAnimation,g.NoAutomaticSize,g.IconRotations,g.Completed if not
p then m.AutomaticSize=Enum.AutomaticSize.None end if not i then n.Visible=true
end self:HeaderCollapseToggle{Tweeninfo=h,Collapsed=i,NoAnimation=o,Toggle=l,
Rotations=q}local s=self:Tween{Tweeninfo=h,NoAnimation=o,Object=m,
StartProperties={Size=i and k or j},EndProperties={Size=i and j or k},Completed=
function()n.Visible=not i if r then r()end if i then return end if p then return
end m.Size=UDim2.fromScale(1,0)m.AutomaticSize=Enum.AutomaticSize.Y end}return s
end function GetAndRemove(g,h)local i=h[g]if i then h[g]=nil end return i end
function Merge(g,h)for i,j in next,h do g[i]=j end end function Copy(g,h)local i
=table.clone(g)if h then Merge(i,h)end return i end function NewClass(g)g.
__index=g return setmetatable({},g)end function aa:Warn(...)warn('[ReGui]::',...
)end function aa:IsDoubleClick(g)local h=self.DoubleClickThreshold if g<h then
return true end end function aa:Init(g)g=g or{}if self.Initialised then return
end Merge(self,g)Merge(self,{Initialised=true,HasGamepad=self:IsConsoleDevice(),
HasTouchScreen=self:IsMobileDevice()})self:CheckConfig(self,{ContainerParent=
function()return self:ResolveContainerParent()end,Prefabs=function()return self:
LoadPrefabs()end},true)self:CheckConfig(self,{Container=function()return self:
InsertPrefab('Container',{Parent=self.ContainerParent,Name=self.ContainerName})
end},true)local h=0 c.InputBegan:Connect(function(i)if not self:IsMouseEvent(i)
then return end local j=tick()local k=j-h self:UpdateWindowFocuses()if self:
IsDoubleClick(k)then self:FireMouseEvents'DoubleClick'h=0 else h=j end end)end
function aa:GetVersion()return self.Version end function aa:IsMobileDevice()
return c.TouchEnabled end function aa:IsConsoleDevice()return c.GamepadEnabled
end function aa:GetScreenSize()return workspace.CurrentCamera.ViewportSize end
function aa:LoadPrefabs()local g,h=self.PlayerGui,'ReGui-Prefabs'local i=script:
WaitForChild(h,2)if i then return i end local j=g:WaitForChild(h,2)if j then
return j end return nil end function aa:ResolveContainerParent()local g,h=self.
PlayerGui,self.Debug local i,j={[1]=function()return ad()end,[2]=function()
return b:FindFirstChild'RobloxGui'end,[3]=function()return b end,[4]=function()
return g end},self:CreateInstance'ScreenGui'for k,l in next,i do local m,n=
pcall(l)if not m then continue end local o=pcall(function()j.Parent=n end)if not
o then continue end if h then self:Warn(`Step: {k} was chosen as the parent!: {n
}`)end return n end self:Warn
'The ReGui container does not have a parent defined'return nil end function aa:
CheckConfig(g,h,i)if not g then return end for j,k in next,h do if g[j]~=nil
then continue end if i then k=k()end g[j]=k end return g end function aa:
CheckAssetUrl(g)if tonumber(g)then return`rbxassetid://{g}`end return g end
function aa:CreateInstance(g,h,i)local j=Instance.new(g,h)if i then aa:
SetProperties(j,i)end return j end function aa:ConnectMouseEvent(g,h)local i,j,k
,l,m=h.Callback,h.DoubleClick,h.OnlyMouseHovering,0 if k then m=self:
DetectHover(k)end g.Activated:Connect(function(...)local n=tick()local o=n-l if
m and not m.Hovering then return end if j then if not aa:IsDoubleClick(o)then l=
n return end l=0 end i(...)end)end function aa:ConnectScreenMouseEvent(g,h)local
i,j=self.MouseEvents,h.DoubleClick local k=j and i.DoubleClick or i.Click h.
HoverSignal=self:DetectHover(g)table.insert(k,h)end function aa:FireMouseEvents(
g)local h=self.MouseEvents local i=h[g]for j,k in i do local l,m,n=k.Object,k.
Callback,k.HoverSignal if not n.Hovering then continue end m()end end function
aa:GetAnimation(g)return g and self.Animation or TweenInfo.new(0)end function aa
:GetDictSize(g)local h=0 for i,j in g do h+=1 end return h end function aa:
RemoveAnimationSignals(g)local h=self.AnimationConnections local i=h[g]if not i
then return end for j,k in next,i do k:Disconnect()end end function aa:
AddAnimationSignal(g,h)local i=self.AnimationConnections local j=i[g]if not j
then j={}i[g]=j end table.insert(j,h)end function aa:SetAnimationsEnabled(g)self
.NoAnimations=not g end function aa:SetAnimation(g,h,i)i=i or g local j,k=self.
Animations,h if typeof(h)~='table'then k=j[h]end assert(k,`No animation data for Class {
h}!`)self:RemoveAnimationSignals(i)local l,m,n,o,p,q,r,s,t=k.Init,k.Connections,
k.Tweeninfo,k.NoAnimation,true,{},{}function r:Reset(u)if s then s(u)end end
function r:FireSignal(u)p=u end function r:Refresh(u)if not t then return end q[
t](u)end function r:SetEnabled(u)p=u end for u,v in next,m do local w,x=function
(w)t=u local x=self.NoAnimations if x then return end if not p then return end w
=w==true f:Tween{NoAnimation=w or o,Object=g,Tweeninfo=n,EndProperties=v}end,i[u
]local y=x:Connect(w)self:AddAnimationSignal(i,y)q[u]=w if u==l then s=w end end
r:Reset(true)return r end function aa:GetChildOfClass(g,h)local i=g:
FindFirstChildOfClass(h)if not i then i=self:CreateInstance(h,g)end return i end
function aa:ConnectDrag(g,h)self:CheckConfig(h,{DragStart=ac,DragEnd=ac,
DragMovement=ac,OnDragStateChange=ac})local i,j,k,l,m,n=h.DragStart,h.DragEnd,h.
DragMovement,h.OnDragStateChange,{StartAndEnd={Enum.UserInputType.MouseButton1,
Enum.UserInputType.Touch},Movement={Enum.UserInputType.MouseMovement,Enum.
UserInputType.Touch}},false local o,p,q=function(o,p)local q=o.UserInputType
return table.find(m[p],q)end,function(o)local p=o.Position return Vector2.new(p.
X,p.Y)end,function(o)self._DraggingDisabled=o n=o l(o)end local r=function(r)
local s,t,u,v,w,x=r.CheckDraggingDisabled,r.DraggingRequired,r.UpdateState,r.
IsDragging,r.InputType,r.Callback return function(y)if n~=t then return end if s
and self._DraggingDisabled then return end if not o(y,w)then return end if u
then q(v)end local z=p(y)x(z)end end g.InputBegan:Connect(r{
CheckDraggingDisabled=true,DraggingRequired=false,UpdateState=true,IsDragging=
true,InputType='StartAndEnd',Callback=i})c.InputEnded:Connect(r{DraggingRequired
=true,UpdateState=true,IsDragging=false,InputType='StartAndEnd',Callback=j})c.
InputChanged:Connect(r{DraggingRequired=true,InputType='Movement',Callback=k})
end function aa:MakeDraggable(g)self:CheckConfig(g,{Enabled=true})local h,i,j,k,
l,m,n=g.Move,g.Grab,g.Enabled,g.OnDragStateChange,{}function l:SetEnabled(o)
local p=g.StateChanged self.Enabled=o if p then p(self)end end function l:
CanDrag(o)if not self.Enabled then return end return true end local o,p,q,r=
function(o)if not l:CanDrag()then return end local p=g.DragBegin n=o p(n)end,
function(o)if not l:CanDrag()then return end local p,q=o-n,g.OnUpdate q(p)end,
function(o)m=h.Position end,function(o)local p=UDim2.new(m.X.Scale,m.X.Offset+o.
X,m.Y.Scale,m.Y.Offset+o.Y)f:Tween{Object=h,EndProperties={Position=p}}end self:
CheckConfig(g,{OnUpdate=r,DragBegin=q})self:ConnectDrag(i,{DragStart=o,
DragMovement=p,OnDragStateChange=k})l:SetEnabled(j)return l end function aa:
MakeResizable(g)aa:CheckConfig(g,{MinimumSize=Vector2.new(160,90),MaximumSize=
Vector2.new(math.huge,math.huge)})local h,i,j,k,l=g.MaximumSize,g.MinimumSize,g.
Resize,(g.OnUpdate)local m=aa:InsertPrefab('ResizeGrab',{Parent=j})local n,o,p=
function(n)m.Visible=n.Enabled end,function(n)local o=l+n local p=UDim2.
fromOffset(math.clamp(o.X,i.X,h.X),math.clamp(o.Y,i.Y,h.Y))if k then k(p)return
end f:Tween{Object=j,EndProperties={Size=p}}end,function(n)l=j.AbsoluteSize end
local q=self:MakeDraggable{Grab=m,OnUpdate=o,DragBegin=p,StateChanged=n}q.Grab=m
return q end function aa:IsMouseEvent(g)local h=g.UserInputType.Name return h:
find'Touch'or h:find'Mouse'end function aa:DetectHover(g,h)h=h or{}local i,j,k,l
,m=h.OnInput,h.Anykey,h.MouseMove,h.MouseEnter,h.MouseOnly h.Hovering=false
local n=function(n,o,p)if n and m then if not aa:IsMouseEvent(n)then return end
end if o~=nil then h.Hovering=o end if not l and p then return end if i then
local q=h.Hovering return i(q,n)end end local o={g.MouseEnter:Connect(function()
n(nil,true,true)end),g.MouseLeave:Connect(function()n(nil,false,true)end)}if j
or m then table.insert(o,c.InputBegan:Connect(function(p)n(p)end))end if k then
local p=g.MouseMoved:Connect(n)table.insert(o,p)end function h:Disconnect()for p
,q in next,o do q:Disconnect()end end return h end function aa:StackWindows()
local g,h=self.Windows,20 for i,j in next,g do local k,l=j.WindowFrame,UDim2.
fromOffset(h*i,h*i)j:Center()k.Position+=l end end function aa:UpdateColors(g)
local h,i,j,k,l,m,n,o,p=self.ElementColors,self.ThemeConfigs,self.Debug,self.
_FlagCache,g.Object,g.Tag,g.NoAnimation,g.TagsList,g.Theme local q,r=h[m],k[l]if
typeof(m)=='table'then q=m elseif o then o[l]=m end if not q then return end
local s={}for t,u in next,q do local v=self:GetThemeKey(p,u)if r and r[t]then
continue end if not v then if j then self:Warn(`Color: '{u}' does not exist!`)
end continue end s[t]=v end f:Tween{Object=l,NoAnimation=n,EndProperties=s}end
function aa:MultiUpdateColors(g)local h=g.Objects for i,j in next,h do self:
UpdateColors{TagsList=g.TagsList,Theme=g.Theme,NoAnimation=not g.Animate,Object=
i,Tag=j}end end function aa:ApplyStyle(g,h)local i=self.Styles local j=i[h]if
not j then return end self:ApplyFlags{Object=g,Class=j}end function aa:
MergeMetatables(g,h)local i,j=self.Debug,{}j.__index=function(k,l)local m=g[l]if
m~=nil then return m end local n,o=pcall(function()return h[l]end)if n then if
typeof(o)=='function'then return function(p,...)return o(h,...)end end return o
end return nil end j.__newindex=function(k,l,n)local o=g[l]~=nil or typeof(n)==
'function'if o then g[l]=n return end xpcall(function()h[l]=n end,function(p)if
i then self:Warn(`Newindex Error: {h}.{l} = {n}\n{p}`)end g[l]=n end)end return
setmetatable({},j)end function aa:Concat(g,h)local i=''for j,k in next,g do i..=
tostring(k)..(j~=#g and h or'')end return i end function aa:GetValueFromAliases(
g,h)for i,j in g do local k=h[j]if k~=nil then return k end end return nil end
function aa:RecursiveCall(g,h)for i,j in next,g:GetDescendants()do h(j)end end
function aa:ApplyFlags(g)local h,i,j,k=self.ElementFlags,g.Object,g.Class,g.
WindowClass self:SetProperties(i,j)for l,n in next,h do local o,p,q,r=n.
Properties,n.Callback,n.Recursive,n.WindowProperties local s=self:
GetValueFromAliases(o,j)if k and r and s==nil then s=self:GetValueFromAliases(r,
k)end if s==nil then continue end p(g,i,s)if q then self:RecursiveCall(i,
function(t)p(g,t,s)end)end end end function aa:SetProperties(g,h)for i,j in next
,h do pcall(function()g[i]=j end)end end function aa:InsertPrefab(g,h)local i=
self.Prefabs local j=i.Prefabs local k=j:WaitForChild(g)local l=k:Clone()if h
then local n=h.UsePropertiesList if not n then self:SetProperties(l,h)else self:
ApplyFlags{Object=l,Class=h}end end return l end function aa:GetContentSize(g,h)
local i,j,k,l=g:FindFirstChildOfClass'UIListLayout',g:FindFirstChildOfClass
'UIPadding',(g:FindFirstChildOfClass'UIStroke')if i and not h then l=i.
AbsoluteContentSize else l=g.AbsoluteSize end if j then local n,o,p,q=j.
PaddingTop.Offset,j.PaddingBottom.Offset,j.PaddingLeft.Offset,j.PaddingRight.
Offset l+=Vector2.new(p+q,n+o)end if k then local n=k.Thickness l+=Vector2.new(n
/2,n/2)end return l end function aa:MakeCanvas(g)local h,i,j,k,l=self.Elements,
self.Debug,g.Element,g.WindowClass,g.Class if not k and i then self:Warn(`No WindowClass for {
j}`)print(g)end local n=NewClass(h)n.ParentCanvas=j n.WindowClass=k or false
local o={__index=function(o,p)local q=n[p]if q~=nil then return q end local r=l[
p]if r~=nil then return r end return j[p]end,__newindex=function(o,p,q)local r=l
[p]~=nil if r then l[p]=q else j[p]=q end end}return setmetatable({},o)end
function aa:WrapGeneration(g,h)local i,j=h.Base,self._FlagCache return function(
k,l,...)l=l or{}self:CheckConfig(l,i)local n=l.CloneTable if n then l=table.
clone(l)end local o,p=k.WindowClass,k.ParentCanvas self:CheckConfig(l,{Parent=p,
Name=l.ColorTag})if k==self then k=self.Elements end local q,r=g(k,l,...)local s
,t,u=l.NoAutoTag,l.NoAutoFlags,l.ColorTag if Success==false then if k.Error then
k:Error{Parent=p,Text=q}end self:Warn('Class:',q)error(debug.traceback())end if
r==nil then r=q end if r then j[r]=l end if r then if not s and o then o:
TagElements{[r]=u}end if not t then self:ApplyFlags{Object=r,Class=l,WindowClass
=o}end end return q,r end end function aa:DefineElement(g,h)local i,j,k=self.
Elements,self.ThemeConfigs,self.ElementColors local l,n,o,p,q,r=j.DarkTheme,h.
Base,h.Create,h.Export,h.ThemeTags,h.ColorData self:CheckConfig(n,{ColorTag=g,
ElementStyle=g,Visible=true})if q then Merge(l,q)end if r then Merge(k,r)end
local s=self:WrapGeneration(o,{Base=n})if p then self[g]=s end i[g]=s return s
end function aa:DefineGlobalFlag(g)local h=self.ElementFlags table.insert(h,g)
end function aa:DefineTheme(g,h)local i=self.ThemeConfigs self:CheckConfig(h,{
BaseTheme=i.DarkTheme})local j=GetAndRemove('BaseTheme',h)local k={BaseTheme=j,
Values=h}i[g]=k return k end function aa:GetMouseLocation()local g=self.Mouse
return g.X,g.Y end function aa:SetWindowFocusesEnabled(g)self.
WindowFocusesEnabled=g end function aa:UpdateWindowFocuses()local g,h=self.
Windows,self.WindowFocusesEnabled if not h then return end for i,j in g do local
k=j.HoverConnection if not k then continue end local l=k.Hovering if l then self
:SetFocusedWindow(j)return end end self:SetFocusedWindow(nil)end function aa:
WindowCanFocus(g)if g.NoSelect then return false end if g.Collapsed then return
false end return true end function aa:SetFocusedWindow(g)local h,i=self.
ActiveWindow,self.Windows if h==g then return end self.ActiveWindow=g if g then
local j=self:WindowCanFocus(g)if not j then return end end for j,k in i do local
l=self:WindowCanFocus(k)if not l then continue end local n=k==g k:SetFocused(n)
end end function aa:SetTooltip(g)local h=self.Tooltip if not h then return end
if h==g then return end h.Visible=false self.Tooltip=g end function aa:
SetItemTooltip(g,h)local i,j=self.Elements,self.Container local k=i:Tooltip{
Visible=false,Parent=j.Overlays}task.spawn(h,k)aa:DetectHover(g,{MouseMove=true,
MouseEnter=true,OnInput=function(l,n)k:Update(l)end})end function aa:CheckFlags(
g,h)for i,j in next,g do local k=h[i]if not k then continue end j(k)end end
function aa:GetThemeKey(g,h)local i=self.ThemeConfigs local j=i.DarkTheme g=g or
j if typeof(g)=='string'then g=i[g]end local k,l=g.BaseTheme,g.Values local n=l[
h]if n then return n end if k then return self:GetThemeKey(k,h)end end local g=
aa.Elements g.__index=g function g:GetParent()return self.ParentCanvas end
function g:TagElements(h)local i=self.WindowClass if i then i:TagElements(h)end
end function g:GetThemeKey(h)local i=self.WindowClass if i then return i:
GetThemeKey(h)end return aa:GetThemeKey(nil,h)end function g:SetColorTags(h,i)
local k=self.WindowClass if not k then return end local l,n=k.TagsList,k.Theme
aa:MultiUpdateColors{Animate=i,Theme=n,TagsList=l,Objects=h}end function g:
SetElementFocused(h,i)local k,l,n,o=self.WindowClass,aa.HasTouchScreen,i.Focused
,i.Animation aa:SetAnimationsEnabled(not n)if not n and o then o:Refresh()end if
not k then return end if not l then return end local p=k.ContentCanvas p.
Interactable=not n end aa:DefineElement('Dropdown',{Base={Disabled=false,
MaxSizeY=220,MinSizeX=100,OnClosed=ac,OnSelected=ac},Create=function(h,i)i.
Parent=aa.Container.Overlays local k,l,n,o,p,q,r=i.Selected,i.ParentObject,i.
Items,i.MaxSizeY,i.MinSizeX,i.OnClosed,i.OnSelected if not l then return end
local s,t=h:OverlayScroll(i)local u=t.UIStroke local v,w,x,y=u.Thickness,l.
AbsolutePosition,aa:GetContentSize(l,true),aa:DetectHover(t,{MouseOnly=true,
OnInput=function(v,w)if v then return end i:Close()end})function i:Close()if
self.Disabled then return end self.Disabled=true y:Disconnect()t:Remove()q()end
local z,A=function(z)i:Close()r(z)end,t.Parent.AbsolutePosition t.Position=UDim2
.fromOffset(w.X-A.X+v,w.Y-A.Y+x.Y)for B,C in n do local D,E=typeof(B)~='number'
and B or C,B==k or C==k s:Selectable{Text=tostring(D),Selected=E,ZIndex=6,
Callback=function()return z(D)end}end local D=s:GetCanvasSize()local E,F=math.
clamp(D.Y,x.Y,o),math.clamp(x.X-v,p,math.huge)t.Size=UDim2.fromOffset(F,E)return
i,t end})aa:DefineElement('Tooltip',{Base={Offset=15},Create=function(h,i)local
k,l=i.Offset,h:Overlay(i)local n=aa:MergeMetatables(i,l)function i:Update(o)l.
Visible=o if not o then return end aa:SetTooltip(l)local p,q=aa:
GetMouseLocation()local r=l.Parent.AbsolutePosition l.Position=UDim2.fromOffset(
p-r.X+k,q-r.Y+k)end return n,l end})aa:DefineElement('OverlayScroll',{Base={},
Create=function(h,i)local k,l=h.WindowClass,aa:InsertPrefab('OverlayScroll',i)
local n=l.ContentFrame local o=aa:MakeCanvas{Element=n,WindowClass=k,Class=h}
function i:GetCanvasSize()return n.AbsoluteCanvasSize end local p=aa:
MergeMetatables(i,o)return p,l end})aa:DefineElement('Overlay',{Base={},Create=
function(h,i)local k,l=h.WindowClass,aa:InsertPrefab('Overlay',i)local n=aa:
MakeCanvas{Element=l,WindowClass=k,Class=h}return n,l end})aa:DefineElement(
'Image',{Base={Image='',Callback=ac},Create=function(h,i)local k=i.Image i.Image
=aa:CheckAssetUrl(k)local l=aa:InsertPrefab('Image',i)l.Activated:Connect(
function(...)local n=i.Callback return n(l,...)end)return l end})aa:
DefineElement('VideoPlayer',{Base={Video='',Callback=ac},Create=function(h,i)
local k=i.Video i.Video=aa:CheckAssetUrl(k)local l=aa:InsertPrefab('VideoPlayer'
,i)return l end})aa:DefineElement('Button',{Base={Text='Button',DoubleClick=
false,Callback=ac},Create=function(h,i)local k,l=aa:InsertPrefab('Button',i),i.
DoubleClick aa:ConnectMouseEvent(k,{DoubleClick=l,Callback=function(...)local n=
i.Callback return n(k,...)end})return k end})aa:DefineElement('Selectable',{Base
={Text='Selectable',Callback=ac,Selected=false,Disabled=false,Size=UDim2.
fromScale(1,0),AnimationTags={Selected='Buttons',Unselected='TransparentButtons'
}},Create=function(h,i)local k,l,n=i.Selected,i.Disabled,aa:InsertPrefab(
'Button',i)local o=aa:MergeMetatables(i,n)n.Activated:Connect(function(...)local
p=i.Callback return p(n,...)end)function i:SetSelected(p)local q=self.
AnimationTags local r=p and q.Selected or q.Unselected self.Selected=p aa:
SetAnimation(n,r)end function i:SetDisabled(p)self.Disabled=p n.Interactable=not
p end i:SetSelected(k)i:SetDisabled(l)return o,n end})aa:DefineElement(
'ImageButton',{Base={ElementStyle='Button',Callback=ac},Create=g.Image})aa:
DefineElement('SmallButton',{Base={Text='Button',PaddingTop=UDim.new(),
PaddingBottom=UDim.new(),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),
ColorTag='Button',ElementStyle='Button',Callback=ac},Create=g.Button})aa:
DefineElement('Keybind',{Base={Label='Keybind',ColorTag='Frame',Value=nil,
DeleteKey=Enum.KeyCode.Backspace,IgnoreGameProcessed=true,Enabled=true,Disabled=
false,Callback=ac,OnKeybindSet=ac,OnBlacklistedKeybindSet=ac,KeyBlacklist={},
UiPadding=UDim.new(),AutomaticSize=Enum.AutomaticSize.None,Size=UDim2.new(0.4,0,
0,19)},Create=function(h,i)local k,l,n,o,p=i.Value,i.Label,i.Disabled,i.
KeyBlacklist,aa:InsertPrefab('Button',i)local q,r=aa:MergeMetatables(i,p),
Instance.new'Folder'local s=h:Label{Parent=r,Text=l,Position=UDim2.new(1,5,0.5),
AnchorPoint=Vector2.new(0,0.5)}r.Parent=p local t,u=function(t,...)return t(p,
...)end,function(t)local u=table.find(o,t)return u end function i:SetDisabled(v)
self.Disabled=v p.Interactable=not v h:SetColorTags({[s]=v and'LabelDisabled'or
'Label'},true)end function i:SetValue(v)local w,x=self.OnKeybindSet,self.
DeleteKey if v==x then v=nil end self.Value=v p.Text=v and v.Name or'Not set't(w
,v)end function i:WaitForNewKey()self._WaitingForNewKey=true p.Text='...'p.
Interactable=false end local v=function(v)local w,x=i.OnBlacklistedKeybindSet,i.
Value if not c.WindowFocused then return end if u(v)then t(w,v)return end p.
Interactable=true i._WaitingForNewKey=false if v.Name=='Unknown'then return i:
SetValue(x)end i:SetValue(v)end local w=function(w,x)local y,z,A,B,C,D=i.
IgnoreGameProcessed,i.DeleteKey,i.Enabled,i.Value,i.Callback,w.KeyCode if i.
_WaitingForNewKey then v(D)return end if not A and p.Interactable then return
end if not y and x then return end if D==z then return end if D~=B then return
end t(C,D)end i:SetValue(k)i:SetDisabled(n)i.Connection=c.InputBegan:Connect(w)p
.Activated:Connect(function()i:WaitForNewKey()end)aa:SetAnimation(p,'Inputs')
return q,p end})aa:DefineElement('ArrowButton',{Base={Icon=aa.Icons.Arrow,
Direction='Left',Size=UDim2.fromOffset(21,21),ColorTag='Button',Rotations={Left=
180,Right=0}},Create=function(h,i)local k,l=i.Direction,i.Rotations local n=l[k]
i.IconRotation=n local o=aa:InsertPrefab('ArrowButton',i)o.Activated:Connect(
function(...)local p=i.Callback return p(o,...)end)return o end})aa:
DefineElement('Label',{Base={Font='Inconsolata'},Create=function(h,i)local k,l,n
,o,p,q,r,s=i.Bold,i.Italic,i.Font,i.FontFace,Enum.FontWeight.Medium,Enum.
FontWeight.Bold,Enum.FontStyle.Normal,Enum.FontStyle.Italic local t,u,v=k and q
or p,l and s or r,k or l if not o and v then i.FontFace=Font.fromName(n,t,u)end
return aa:InsertPrefab('Label',i)end})aa:DefineElement('Error',{Base={RichText=
true,TextWrapped=true},ColorData={Error={TextColor3='ErrorText',FontFace=
'TextFont'}},Create=function(h,i)local k=i.Text i.Text=`<b>\u{26d4} Error:</b> {
k}`return h:Label(i)end})local h={ColorTags={BGSelected={[true]='SelectedTab',[
false]='DeselectedTab'},LabelSelected={[true]='SelectedTabLabel',[false]=
'DeselectedTabLabel'}}}function h:UpdateButton(i,k)local l,n=i.IsSelected,i.Tab
local o=n.Button if l==k then return end i.IsSelected=k local p,q,r=self.
NoAnimation,self.WindowClass,self.ColorTags local s,t,u,v=q.Theme,q.TagsList,r.
BGSelected,r.LabelSelected aa:MultiUpdateColors{Animate=not p,Theme=s,TagsList=t
,Objects={[o]=u[k],[o.Label]=v[k]}}end function h:SetActiveTab(i)local k,l,n,o,p
=self.Tabs,self.NoAnimation,typeof(i)=='string',false for q,r in next,k do local
s,t,u,v=r.Content,r.Canvas,r.Name,false if n then v=u==i else v=t==i end if v
then o=s.Visible p=s end s.Visible=v self:UpdateButton(r,v)end if l then return
self end if o then return self end if not p then return self end f:Tween{Object=
p,NoAnimation=l,StartProperties={Position=UDim2.fromOffset(0,5)},EndProperties={
Position=UDim2.fromOffset(0,0)}}return self end function h:RemoveTab(i)local k,l
=self.Tabs,typeof(i)=='string'for n,o in k do local p,q,r,s,t=o.Canvas,o.Name,o.
Content,o.Tab,false if l then t=q==i else t=p==i end if not t then continue end
table.remove(k,n)r:Destroy()s:Destroy()end return self end function h:CreateTab(
i)aa:CheckConfig(i,{Name='Tab',AutoSize='Y',Closeable=false})local k,l,n,o,p,q,r
,s,t,u=self.AutoSelectNewTabs,self.ParentCanvas,self.WindowClass,self.Templates,
self.TabsBar,self.Body,self.Tabs,i.Name,i.Icon,i.AutoSize local v,w,x=#r<=0 and
k,o.Page,o.TabButton local y=x:Clone()local z=y.Button local A,B=z.Label,aa:
GetChildOfClass(z,'UIPadding')A.Text=tostring(s)y.Parent=p y.Visible=true local
C=w:Clone()local D=aa:GetChildOfClass(C,'UIPadding')aa:SetProperties(C,{Parent=q
,Name=s,Visible=v})local E=aa:MakeCanvas{Element=C,WindowClass=n,Class=self}
local F,G,H=function()self:SetActiveTab(E)end,{Name=s,Tab=y,Canvas=E,Content=C},
{Closeable=function()local F=l:RadioButton{Parent=z,Visible=not self.NoClose,
Icon=aa.Icons.Close,IconSize=UDim2.fromOffset(11,11),LayoutOrder=3,ZIndex=2,
UsePropertiesList=true,Callback=function()self:RemoveTab(E)end}local G=F.Icon aa
:SetAnimation(G,{Connections={MouseEnter={ImageTransparency=0},MouseLeave={
ImageTransparency=1}},Init='MouseLeave'},y)end}z.Activated:Connect(F)aa:
CheckFlags(H,i)table.insert(r,G)n:TagElements{[z]='Tab',[A]='TabLabel',[B]=
'TabSelectorTabPadding',[D]='TabSelectorPagePadding'}aa:SetProperties(C,{
AutomaticSize=Enum.AutomaticSize[u],Size=UDim2.fromScale(u=='Y'and 1 or 0,u=='X'
and 1 or 0)})aa:SetAnimation(z,'Buttons')aa:ApplyFlags{Object=z,Class={Icon=t}}
self:UpdateButton(G,v)return E end aa:DefineElement('TabSelector',{Base={
NoTabsBar=false,AutoSelectNewTabs=true},ColorData={DeselectedTab={
BackgroundColor3='TabBg'},SelectedTab={BackgroundColor3='TabBgActive'},
DeselectedTabLabel={FontFace='TextFont',TextColor3='TabText'},SelectedTabLabel={
FontFace='TextFont',TextColor3='TabTextActive'},TabSelectorLine={Color=
'TabBgActive'},TabSelectorTabPadding={PaddingTop='TabTextPaddingTop',
PaddingBottom='TabTextPaddingBottom'},TabSelectorPagePadding={PaddingBottom=
'TabPadding',PaddingLeft='TabPadding',PaddingRight='TabPadding',PaddingTop=
'TabPadding'}},Create=function(i,k)local l,n,o,p=i.WindowClass,k.NoTabsBar,aa:
InsertPrefab('TabSelector',k),NewClass(h)local q,r=o.TabsBar,o.Body local s,t,u=
q.TemplateButton,r.PageTemplate,q:FindFirstChildOfClass'UIStroke's.Visible=false
t.Visible=false q.Visible=not n Merge(p,k)Merge(p,{Templates={TabButton=s,Page=t
},ParentCanvas=i,WindowClass=l,Body=r,TabsBar=q,Tabs={}})i:TagElements{[q]=
'TabSelectorTabsBar',[u]='TabSelectorLine'}return p,o end})aa:DefineElement(
'RadioButton',{Base={Callback=ac},Create=function(i,k)local l=aa:InsertPrefab(
'RadioButton',k)l.Activated:Connect(function(...)local n=k.Callback return n(l,
...)end)return l end})aa:DefineElement('Checkbox',{Base={Label='Checkbox',
IsRadio=false,Value=false,NoAutoTag=true,TickedImageSize=UDim2.fromScale(1,1),
UntickedImageSize=UDim2.fromScale(0,0),Callback=ac,Disabled=false},Create=
function(i,k)local l,n,o,p,q,r,s=k.IsRadio,k.Value,k.Label,k.TickedImageSize,k.
UntickedImageSize,k.Disabled,aa:InsertPrefab('CheckBox',k)local t,u=aa:
MergeMetatables(k,s),s.Tickbox local v=u.Tick v.Image=aa.Icons.Checkmark local w
,x,y,z=u:FindFirstChildOfClass'UIPadding',aa:GetChildOfClass(u,'UICorner'),i:
Label{Text=o,Parent=s,LayoutOrder=2},UDim.new(0,3)if l then v.ImageTransparency=
1 v.BackgroundTransparency=0 x.CornerRadius=UDim.new(1,0)else z=UDim.new(0,2)end
aa:SetProperties(w,{PaddingBottom=z,PaddingLeft=z,PaddingRight=z,PaddingTop=z})
local A,B=function(...)local A=k.Callback return A(t,...)end,function(A,B)local
C,D=i:GetThemeKey'AnimationTweenInfo',A and p or q f:Tween{Object=v,Tweeninfo=C,
NoAnimation=B,EndProperties={Size=D}}end function k:SetDisabled(C)self.Disabled=
C s.Interactable=not C i:SetColorTags({[y]=C and'LabelDisabled'or'Label'},true)
end function k:SetTicked(C,D)self.Value=C B(C,D)A(C)return self end function k:
Toggle()local C=not self.Value self.Value=C self:SetTicked(C)return self end
local C=function()k:Toggle()end s.Activated:Connect(C)u.Activated:Connect(C)k:
SetTicked(n,true)k:SetDisabled(r)aa:SetAnimation(u,'Buttons',s)i:TagElements{[v]
='CheckMark',[u]='Checkbox'}return t,s end})aa:DefineElement('Radiobox',{Base={
IsRadio=true,CornerRadius=UDim.new(1,0)},Create=function(i,k)return i:Checkbox(k
)end})aa:DefineElement('PlotHistogram',{Base={ColorTag='Frame',Label='Histogram'
},Create=function(i,k)local l,n,o=k.Label,k.Points,aa:InsertPrefab('Histogram',k
)local p,q=aa:MergeMetatables(k,o),o.Canvas local r=q.PointTemplate r.Visible=
false local s=(i:Label{Text=l,Parent=o,Position=UDim2.new(1,5)})aa:
SetItemTooltip(o,function(t)ValueLabel=t:Label()end)Merge(k,{_Plots={},_Cache={}
})function k:GetBaseValues()local t,u=self.Minimum,self.Maximum if t and u then
return t,u end local v=self._Plots for w,x in v do local y=x.Value if not t or y
<t then t=y end if not u or y>u then u=y end end return t,u end function k:
UpdateGraph()local t,u,v=self._Plots,self:GetBaseValues()if not u or not v then
return end local w=v-u for x,y in t do local z,A=y.Point,y.Value local B=(A-u)/w
B=math.clamp(B,0.05,1)z.Size=UDim2.fromScale(1,B)end return self end function k:
Plot(t)local u,v,w=self._Plots,{},r:Clone()local x=w.Bar aa:SetProperties(w,{
Parent=q,Visible=true})local y,z=aa:DetectHover(w,{MouseEnter=true,OnInput=
function()v:UpdateTooltip()end}),{Object=w,Point=x,Value=t}function v:
UpdateTooltip()local A=v:GetPointIndex()ValueLabel.Text=`{A}:\t{z.Value}`end
function v:SetValue(A)z.Value=A k:UpdateGraph()if y.Hovering then self:
UpdateTooltip()end end function v:GetPointIndex()return table.find(u,z)end
function v:Remove(A)table.remove(u,self:GetPointIndex())w:Remove()k:UpdateGraph(
)end table.insert(u,z)self:UpdateGraph()aa:SetAnimation(x,'Plots',w)i:
TagElements{[x]='Plot'}return v end function k:PlotGraph(t)local u=self._Cache
local v=#u-#t if v>=1 then for w=1,v do local x=table.remove(u,w)if x then x:
Remove()end end end for w,x in t do local y=u[w]if y then y:SetValue(x)continue
end u[w]=self:Plot(x)end return self end if n then k:PlotGraph(n)end return p,o
end})aa:DefineElement('Viewport',{Base={IsRadio=true},Create=function(i,k)local
l=aa:InsertPrefab('Viewport',k)local n,o=aa:MergeMetatables(k,l),l.Viewport
local p,q,r=o.WorldModel,k.Model,k.Camera if not r then r=aa:CreateInstance(
'Camera',o)r.CFrame=CFrame.new(0,0,0)end Merge(k,{Camera=r,WorldModel=p,Viewport
=o})function k:SetCamera(s)o.CurrentCamera=s self.Camera=s return self end
function k:SetModel(s,t)local u=self.Clone p:ClearAllChildren()if u then s=s:
Clone()end if t then s:PivotTo(t)end s.Parent=p self.Model=s return s end if q
then k:SetModel(q)end k:SetCamera(r)return n end})aa:DefineElement('InputText',{
Base={Value='',Placeholder='',Label='Input text',Callback=ac,MultiLine=false,
NoAutoTag=true,Disabled=false},Create=function(i,k)local l,n,o,p,q=k.MultiLine,k
.Placeholder,k.Label,k.Disabled,aa:InsertPrefab('InputBox',k)local r=q.Frame
local s,t=r.Input,aa:MergeMetatables(k,q)i:Label{Parent=q,Text=o,AutomaticSize=
Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,19),Position=UDim2.new(1,5),
LayoutOrder=2}aa:SetProperties(s,{PlaceholderText=n,MultiLine=l})local u=
function(...)local u=k.Callback u(t,...)end function k:SetValue(v)s.Text=
tostring(v)self.Value=v return self end function k:SetDisabled(v)self.Disabled=v
q.Interactable=not v i:SetColorTags({[o]=v and'LabelDisabled'or'Label'},true)end
function k:Clear()s.Text=''return self end local v=function()local v=s.Text k.
Value=v u(v)end s:GetPropertyChangedSignal'Text':Connect(v)k:SetDisabled(p)i:
TagElements{[s]='Frame'}return t,q end})aa:DefineElement('InputInt',{Base={Value
=0,Increment=1,Placeholder='',Label='Input Int',Callback=ac},Create=function(i,k
)local l,n,o,p,q,r=k.Value,k.Placeholder,k.Label,k.Disabled,k.NoButtons,aa:
InsertPrefab('InputBox',k)local s,t=aa:MergeMetatables(k,r),r.Frame local u=t.
Input u.PlaceholderText=n local v,w,x,y=i:Button{Text='-',Parent=t,LayoutOrder=2
,Ratio=1,AutomaticSize=Enum.AutomaticSize.None,FlexMode=Enum.UIFlexMode.None,
Size=UDim2.fromScale(1,1),Visible=not q,Callback=function()k:Decrease()end},i:
Button{Text='+',Parent=t,LayoutOrder=3,Ratio=1,AutomaticSize=Enum.AutomaticSize.
None,FlexMode=Enum.UIFlexMode.None,Size=UDim2.fromScale(1,1),Visible=not q,
Callback=function()k:Increase()end},i:Label{Parent=r,Text=o,AutomaticSize=Enum.
AutomaticSize.X,Size=UDim2.fromOffset(0,19),Position=UDim2.new(1,5),LayoutOrder=
4},function(...)local v=k.Callback v(s,...)end function k:Increase()local z,A=
self.Value,self.Increment k:SetValue(z+A)end function k:Decrease()local z,A=self
.Value,self.Increment k:SetValue(z-A)end function k:SetDisabled(z)self.Disabled=
z r.Interactable=not z i:SetColorTags({[x]=z and'LabelDisabled'or'Label'},true)
end function k:SetValue(z)local A,B,C=self.Value,self.Minimum,self.Maximum z=
tonumber(z)if not z then z=A end if B and C then z=math.clamp(z,B,C)end u.Text=z
k.Value=z y(z)return self end local z=function()local z=u.Text k:SetValue(z)end
k:SetValue(l)k:SetDisabled(p)u.FocusLost:Connect(z)i:TagElements{[w]='Button',[v
]='Button',[u]='Frame'}return s,r end})aa:DefineElement('InputTextMultiline',{
Base={Label='',Size=UDim2.new(1,0,0,39),Border=false,ColorTag='Frame'},Create=
function(i,k)return i:Console(k)end})aa:DefineElement('Console',{Base={Enabled=
true,ReadOnly=false,Value='',TextWrapped=false,RichText=false,LineNumbers=false,
LinesFormat='%s',Callback=ac},Create=function(i,k)local l,n,o,p,q,r=k.ReadOnly,k
.LineNumbers,k.Fill,k.Value,k.Placeholder,aa:InsertPrefab('Console',k)local s,t,
u=aa:MergeMetatables(k,r),r.Source,r.Lines aa:SetProperties(t,k)aa:
SetProperties(t,{TextEditable=not l,Parent=r,PlaceholderText=q})u.Visible=n
function k:UpdateLineNumbers()local v,w=self.LineNumbers,self.LinesFormat if not
v then return end local x=#t.Text:split'\n'u.Text=''for y=1,x do local z,A=w:
format(y),y~=x and'\n'or''u.Text..=`{z}{A}`end local y=u.AbsoluteSize.X t.Size=
UDim2.new(1,-y,0,0)return self end function k:CheckLineCount()local v=k.MaxLines
if not v then return end local w=t.Text local x=w:split'\n'if#x>v then local y=`{
x[1]}\\n`local z=w:sub(#y)self:SetValue(z)end return self end function k:
UpdateScroll()local v=r.AbsoluteCanvasSize r.CanvasPosition=Vector2.new(0,v.Y)
return self end function k:SetValue(v)if not self.Enabled then return end t.Text
=tostring(v)self:Update()return self end function k:GetValue()return t.Text end
function k:Clear()t.Text=''self:Update()return self end function k:AppendText(
...)local v,w='\n'..aa:Concat({...},' '),self:GetValue()self:SetValue(w..v)self:
CheckLineCount()return self end function k:Update()local v=k.AutoScroll k:
UpdateLineNumbers()if v then k:UpdateScroll()end end local v=function()local v=k
:GetValue()k:Update()k.Callback(v)end k:SetValue(p)i:TagElements{[t]=
'ConsoleText'}t:GetPropertyChangedSignal'Text':Connect(v)return s,r end})aa:
DefineElement('Table',{Base={VerticalAlignment=Enum.VerticalAlignment.Top,
RowBackground=false,RowBgTransparency=0.87,Border=false},Create=function(i,k)
local l,n,o,p,q,r,s=i.WindowClass,k.RowBgTransparency,k.RowBackground,k.Border,k
.VerticalAlignment,k.MaxColumns,aa:InsertPrefab('Table',k)local t,u,v,w=aa:
MergeMetatables(k,s),s.RowTemp,0,{}function k:Row(x)x=x or{}local y,z,A,B=x.
IsHeader,0,{},u:Clone()aa:SetProperties(B,{Name='Row',Visible=true,Parent=s})
local C=B:FindFirstChildOfClass'UIListLayout'C.VerticalAlignment=q if y then i:
TagElements{[B]='Header'}else v+=1 end if o and not y then local D=v%2~=1 and n
or 1 B.BackgroundTransparency=D end local D={}function D:Column(E)local F=B.
ColumnTemp:Clone()aa:SetProperties(F,{Visible=true,Parent=B,Name='Column'})local
G=F:FindFirstChildOfClass'UIStroke'G.Enabled=p return aa:MakeCanvas{Element=F,
WindowClass=l,Class=t}end function D:NextColumn()z+=1 local E=z%r+1 local F=A[E]
if not F then F=self:Column()A[E]=F end return F end table.insert(w,D)local E=aa
:MergeMetatables(D,B)return E end function k:NextRow()return self:Row()end
function k:HeaderRow()return self:Row{IsHeader=true}end function k:ClearRows()v=
0 for x,y in next,s:GetChildren()do if not y:IsA'Frame'then continue end if y==u
then continue end y:Destroy()end return k end return t,s end})aa:DefineElement(
'List',{Base={Spacing=5,HorizontalFlex=Enum.UIFlexAlignment.None,VerticalFlex=
Enum.UIFlexAlignment.None,HorizontalAlignment=Enum.HorizontalAlignment.Left,
VerticalAlignment=Enum.VerticalAlignment.Top},Create=function(i,k)local l,n,o,p,
q,r,s=i.WindowClass,k.Spacing,k.HorizontalFlex,k.VerticalFlex,k.
HorizontalAlignment,k.VerticalAlignment,aa:InsertPrefab('List',k)local t,u=aa:
MergeMetatables(k,s),s.UIListLayout aa:SetProperties(u,{Padding=UDim.new(0,n),
HorizontalFlex=o,VerticalFlex=p,HorizontalAlignment=q,VerticalAlignment=r})local
v=aa:MakeCanvas{Element=s,WindowClass=l,Class=t}return v,s end})aa:
DefineElement('CollapsingHeader',{Base={Title='Collapsing Header',Icon=aa.Icons.
Arrow,Collapsed=true,Offset=0,NoAutoTag=true,NoAutoFlags=true},Create=function(i
,k)local l,n,o,p,q,r,s,t,u=k.Title,k.Icon,k.Collapsed,k.ElementStyle,k.Offset,k.
TitleBarProperties,k.OpenOnDoubleClick,k.OpenOnArrow,aa:InsertPrefab(
'CollapsingHeader',k)local v=u.TitleBar local w=v.Toggle.Icon w.Image=n local x,
y,z=i:Label{ColorTag='CollapsingHeader',Text=l,Parent=v,LayoutOrder=2},i:Indent{
Parent=u,Offset=q,LayoutOrder=2,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.
AutomaticSize.None,PaddingTop=UDim.new(0,4),UsePropertiesList=true}function k:
SetCollapsed(A)self.Collapsed=A local B,C,D=aa:GetContentSize(z),y:GetThemeKey
'AnimationTweenInfo',UDim2.fromScale(1,0)local E=D+UDim2.fromOffset(0,B.Y)f:
HeaderCollapse{Tweeninfo=C,Collapsed=A,Toggle=w,Resize=z,Hide=z,ClosedSize=D,
OpenSize=E}return self end local A=function()k:SetCollapsed(not k.Collapsed)end
if r then aa:ApplyFlags{Object=v,Class=r}end if not t then aa:ConnectMouseEvent(
v,{DoubleClick=s,Callback=A})end w.Activated:Connect(A)k:SetCollapsed(o)aa:
ApplyStyle(v,p)y:TagElements{[v]='CollapsingHeader'}return y,u end})aa:
DefineElement('TreeNode',{Base={Offset=21,TitleBarProperties={Size=UDim2.new(1,0
,0,14)}},Create=function(i,k)return i:CollapsingHeader(k)end})aa:DefineElement(
'Separator',{Base={NoAutoTag=true,NoAutoTheme=true},Create=function(i,k)local l,
n=k.Text,aa:InsertPrefab('SeparatorText',k)i:Label{Text=tostring(l),Visible=l~=
nil,Parent=n,LayoutOrder=2,Size=UDim2.new(),PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4)}i:TagElements{[n.Left]='Separator',[n.Right]=
'Separator'}return n end})aa:DefineElement('Canvas',{Base={Scroll=false},Create=
function(i,k)local l,n=i.WindowClass,k.Scroll local o=n and'ScrollingCanvas'or
'Canvas'local p=aa:InsertPrefab(o,k)local q=aa:MakeCanvas{Element=p,WindowClass=
l,Class=k}return q,p end})aa:DefineElement('Region',{Base={Scroll=false,
AutomaticSize=Enum.AutomaticSize.Y},Create=function(i,k)local l,n=i.WindowClass,
k.Scroll local o=n and'ScrollingCanvas'or'Canvas'local p=aa:InsertPrefab(o,k)
local q=aa:MakeCanvas{Element=p,WindowClass=l,Class=k}return q,p end})aa:
DefineElement('Group',{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize.Y},
Create=function(i,k)local l,n=i.WindowClass,aa:InsertPrefab('Group',k)local o=aa
:MakeCanvas{Element=n,WindowClass=l,Class=k}return o,n end})aa:DefineElement(
'Indent',{Base={Offset=15,PaddingTop=UDim.new(),PaddingBottom=UDim.new(),
PaddingRight=UDim.new()},Create=function(i,k)local l=k.Offset k.PaddingLeft=UDim
.new(0,l)return i:Canvas(k)end})aa:DefineElement('BulletText',{Base={},Create=
function(i,k)local l=k.Rows for n,o in next,l do local p=i:Bullet(k)p:Label{Text
=tostring(o),LayoutOrder=2,Size=UDim2.fromOffset(0,14)}end end})aa:
DefineElement('Bullet',{Base={Padding=3,Icon=aa.Icons.Dot,IconSize=UDim2.
fromOffset(5,5)},Create=function(i,k)local l,n,o=i.WindowClass,k.Padding,aa:
InsertPrefab('Bullet',k)local p,q=aa:MakeCanvas{Element=o,WindowClass=l,Class=i}
,o.UIListLayout q.Padding=UDim.new(0,n)return p,o end})aa:DefineElement('Row',{
Base={Spacing=4,Expanded=false},Create=function(i,k)local l,n,o,p=i.WindowClass,
k.Spacing,k.Expanded,aa:InsertPrefab('Row',k)local q,r=aa:MergeMetatables(k,p),p
:FindFirstChildOfClass'UIListLayout'r.Padding=UDim.new(0,n)function k:Expand()r.
HorizontalFlex=Enum.UIFlexAlignment.Fill return self end local s=aa:MakeCanvas{
Element=p,WindowClass=l,Class=q}if o then k:Expand()end return s,p end})aa:
DefineElement('SliderBase',{Base={Format='%.f',Label='',Type='Slider',Callback=
ac,NoGrab=false,NoClick=false,Minimum=0,Maximum=100,ColorTag='Frame',Disabled=
false},Create=function(i,k)local l,n,o,p,q,r,s,t,u=k.Value or k.Minimum,k.Format
,k.Label,k.NoAnimation,k.NoGrab,k.NoClick,k.Type,k.Disabled,aa:InsertPrefab
'Slider'local v=u.Track local w,x,y,z=v.Grab,v.ValueText,v:FindFirstChildOfClass
'UIPadding',aa:MergeMetatables(k,u)local A,B,C=w.AbsoluteSize,aa:SetAnimation(u,
'Inputs'),i:Label{Parent=u,Text=o,Position=UDim2.new(1,5),Size=UDim2.fromScale(0
,1)}Merge(k,{Grab=w,Name=o})if s=='Slider'then v.Position=UDim2.fromOffset(A.X/2
,0)v.Size=UDim2.new(1,-A.X,1,0)end local D,E={Slider=function(D)return{
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(D,0.5)}end,Progress=
function(D)return{Size=UDim2.fromScale(D,1)}end,Snap=function(D,E,F,G)local H=(
math.round(E)-F)/G return{Size=UDim2.fromScale(1/G,1),Position=UDim2.fromScale(H
,0.5)}end},function(...)local D=k.Callback return D(z,...)end function k:
SetDisabled(F)self.Disabled=F u.Interactable=not F i:SetColorTags({[C]=F and
'LabelDisabled'or'Label'},true)end function k:SetValueText(F)x.Text=tostring(F)
end function k:SetValue(F,G)local H,I,J,K=i:GetThemeKey'AnimationTweenInfo',k.
Minimum,k.Maximum,F local L=J-I if not G then K=(F-I)/L else F=I+(L*K)end K=math
.clamp(K,0,1)local M=D[s](K,F,I,J)f:Tween{Object=w,Tweeninfo=H,NoAnimation=p,
EndProperties=M}self.Value=F self:SetValueText(n:format(F,J))E(F)return self end
local F,G=function(F)i:SetColorTags({[u]=F and'FrameActive'or'Frame'},true)i:
SetElementFocused(u,{Focused=F,Animation=B})end,function()if k.Disabled then
return end if k.ReadOnly then return end return true end local H=function(H)if
not G()then return end local I,J,K=v.AbsolutePosition.X,v.AbsoluteSize.X,H.X
local L=K-I local M=math.clamp(L/J,0,1)k:SetValue(M,true)end local I,J=function(
...)if not G()then return end F(true)if not r then H(...)end end,function()F(
false)end w.Visible=not q k:SetValue(l)k:SetDisabled(t)i:TagElements{[x]='Label'
,[w]='SliderGrab'}aa:ConnectDrag(v,{DragStart=I,DragMovement=H,DragEnd=J})return
z,u end})aa:DefineElement('SliderEnum',{Base={Items={},Label='Slider Enum',Type=
'Snap',Minimum=1,Maximum=10,Value=1,Callback=ac,ColorTag='Frame'},Create=
function(i,k)local l,n=k.Callback,k.Value local o=function(o,p)p=math.round(p)
local q=o.Items o.Maximum=#q return q[p]end k.Callback=function(p,q,r)local s=o(
p,q)p:SetValueText(s)k.Value=s return l(p,s)end o(k,n)return i:SliderBase(k)end}
)aa:DefineElement('SliderInt',{Base={Label='Slider Int',ColorTag='Frame'},Create
=g.SliderBase})aa:DefineElement('SliderFloat',{Base={Label='Slider Float',Format
='%.3f',ColorTag='Frame'},Create=g.SliderBase})aa:DefineElement('DragInt',{Base=
{Format='%.f',Label='Drag Int',Callback=ac,Minimum=0,Maximum=100,ColorTag=
'Frame',Disabled=false},Create=function(i,k)local l,n,o,p,q=k.Value or k.Minimum
,k.Format,k.Label,k.Disabled,aa:InsertPrefab'Slider'local r,s=aa:
MergeMetatables(k,q),q.Track local t,u=s.ValueText,s.Grab u.Visible=false local
v,w,x,y,z,A=aa:GetChildOfClass(s,'UIDragDetector'),i:Label{Parent=q,Text=o,
Position=UDim2.new(1,7),Size=UDim2.fromScale(0,1)},0,0,aa:SetAnimation(q,
'Inputs'),function(...)local v=k.Callback return v(r,...)end function k:SetValue
(B,C)local D,E=self.Minimum,self.Maximum local F=E-D if not C then x=((B-D)/F)*
100 else B=D+(F*(x/100))end B=math.clamp(B,D,E)self.Value=B t.Text=n:format(B,E)
A(B)return self end function k:SetDisabled(B)self.Disabled=B i:SetColorTags({[w]
=B and'LabelDisabled'or'Label'},true)end local B,C=function(B)i:SetColorTags({[q
]=B and'FrameActive'or'Frame'},true)i:SetElementFocused(q,{Focused=B,Animation=z
})end,function()if k.Disabled then return end if k.ReadOnly then return end
return true end local D,E,F=function(D)if not C()then return end B(true)
InputBeganPosition=D y=x end,function(D)if not C()then return end local E=D.X-
InputBeganPosition.X local F=y+(E/2)x=math.clamp(F,0,100)k:SetValue(x,true)end,
function()B(false)end k:SetValue(l)k:SetDisabled(p)aa:ConnectDrag(s,{DragStart=D
,DragEnd=F,DragMovement=E})return r,q end})aa:DefineElement('DragFloat',{Base={
Format='%.3f',Label='Drag Float',ColorTag='Frame'},Create=g.DragInt})aa:
DefineElement('MultiElement',{Base={Callback=ac,Label='',Disabled=false,
BaseInputConfig={},InputConfigs={},Value={},Minimum={},Maximum={},MultiCallback=
ac},Create=function(i,k)local l,n,o,p,q,r,s,t=k.Label,k.BaseInputConfig,k.
InputConfigs,k.InputType,k.Disabled,k.Value,k.Minimum,k.Maximum assert(p,
'No input type provided for MultiElement')local u=i:Row{Spacing=5}local v,w,x,y=
u:Row{Size=UDim2.fromScale(0.65,0),Expanded=true},u:Label{Size=UDim2.fromScale(
0.35,0),LayoutOrder=2,Text=l},aa:MergeMetatables(k,u),{}local z=function()local
z={}for A,B in y do z[A]=B:GetValue()end k.Value=z return z end local A=function
()local A=k.MultiCallback if#y~=#o then return end local B=z()A(x,B)end function
k:SetDisabled(B)self.Disabled=B i:SetColorTags({[w]=B and'LabelDisabled'or
'Label'},true)for C,D in y do D:SetDisabled(B)end end function k:SetValue(B)for
C,D in B do local E=y[C]assert(E,`No input object for index: {C}`)E:SetValue(D)
end end n=Copy(n,{Size=UDim2.new(1,0,0,19),Label='',Callback=A})for B,C in o do
local D=Copy(n,C)aa:CheckConfig(D,{Minimum=s[B],Maximum=t[B]})local E=v[p](v,D)
table.insert(y,E)end A()Merge(k,{Row=v,Inputs=y})k:SetDisabled(q)k:SetValue(r)
return x,u end})local i=function(i,k,l,n)aa:DefineElement(i,{Base={Label=i,
Callback=ac,InputType=k,InputConfigs=table.create(l,{}),BaseInputConfig={}},
Create=function(o,p)local q=(p.BaseInputConfig)if n then Merge(q,n)end aa:
CheckConfig(q,{ReadOnly=p.ReadOnly,Format=p.Format})p.MultiCallback=function(...
)local r=p.Callback r(...)end return o:MultiElement(p)end})end local k=function(
k,l,n,o)aa:DefineElement(k,{Base={Label=k,Callback=ac,Value=aa.Accent.Light,
Disabled=false,Minimum={0,0,0},Maximum={255,255,255},BaseInputConfig={},
InputConfigs={[1]={Format='R: %.f'},[2]={Format='G: %.f'},[3]={Format='B: %.f'}}
},Create=function(p,q)local r,s,t,u=q.BaseInputConfig,q.Value,q.Disabled,Copy(q,
{Value={1,1,1},Callback=function(r,...)if q.ValueChanged then q:ValueChanged(...
)end end})local v=p[l](p,u)local w,x=aa:MergeMetatables(q,v),v.Row local y,z=x:
Button{BackgroundTransparency=0,Size=UDim2.fromOffset(19,19),UiPadding=0,Text=''
,Ratio=1,ColorTag='',ElementStyle=''},function(...)local y=q.Callback return y(w
,...)end local A=function(A)y.BackgroundColor3=A z(A)end function q:ValueChanged
(B)local C,D,E=B[1],B[2],B[3]local F=Color3.fromRGB(C,D,E)self.Value=F A(F)end
function q:SetValue(B)self.Value=B A(B)v:SetValue{math.round(B.R*255),math.
round(B.G*255),math.round(B.B*255)}end q:SetValue(s)return w,x end})end local l=
function(l,n,o,p)aa:DefineElement(l,{Base={Label=l,Callback=ac,Disabled=false,
Value=CFrame.new(10,10,10),Minimum=CFrame.new(0,0,0),Maximum=CFrame.new(100,100,
100),BaseInputConfig={},InputConfigs={[1]={Format='X: %.f'},[2]={Format='Y: %.f'
},[3]={Format='Z: %.f'}}},Create=function(q,r)local s,t,u,v,w=r.BaseInputConfig,
r.Value,r.Disabled,r.Maximum,r.Minimum local x=Copy(r,{Maximum={v.X,v.Y,v.Z},
Minimum={w.X,w.Y,w.Z},Value={t.X,t.Y,t.Z},Callback=function(x,...)if r.
ValueChanged then r:ValueChanged(...)end end})local y=q[n](q,x)local z,A=aa:
MergeMetatables(r,y),y.Row local B=function(...)local B=r.Callback return B(z,
...)end function r:ValueChanged(C)local D,E,F=C[1],C[2],C[3]local G=CFrame.new(D
,E,F)self.Value=G B(G)end function r:SetValue(C)self.Value=C y:SetValue{math.
round(C.X),math.round(C.Y),math.round(C.Z)}end r:SetValue(t)return z,A end})end
i('InputInt2','InputInt',2,{NoButtons=true})i('InputInt3','InputInt',3,{
NoButtons=true})i('InputInt4','InputInt',4,{NoButtons=true})i('SliderInt2',
'SliderInt',2)i('SliderInt3','SliderInt',3)i('SliderInt4','SliderInt',4)i(
'SliderFloat2','SliderFloat',2)i('SliderFloat3','SliderFloat',3)i('SliderFloat4'
,'SliderFloat',4)i('DragInt2','DragInt',2)i('DragInt3','DragInt',3)i('DragInt4',
'DragInt',4)i('DragFloat2','DragFloat',2)i('DragFloat3','DragFloat',3)i(
'DragFloat4','DragFloat',4)k('InputColor3','InputInt3')k('SliderColor3',
'SliderInt3')k('DragColor3','DragInt3')l('InputCFrame','InputInt3')l(
'SliderCFrame','SliderInt3')l('DragCFrame','DragInt3')aa:DefineElement(
'SliderProgress',{Base={Label='Slider Progress',Type='Progress',ColorTag='Frame'
},Create=g.SliderBase})aa:DefineElement('ProgressBar',{Base={Label=
'Progress Bar',Type='Progress',ReadOnly=true,MinValue=0,MaxValue=100,Format=
'% i%%',Interactable=false,ColorTag='Frame'},Create=function(n,o)function o:
SetPercentage(p)o:SetValue(p)end local p,q=n:SliderBase(o)local r=p.Grab n:
TagElements{[r]={BackgroundColor3='ProgressBar'}}return p,q end})aa:
DefineElement('Combo',{Base={Value='',Placeholder='',Callback=ac,Items={},
Disabled=false,WidthFitPreview=false,Label='Combo'},Create=function(n,o)local p,
q,r,s,t,u,v=o.Placeholder,o.NoAnimation,o.Selected,o.Label,o.Disabled,o.
WidthFitPreview,aa:InsertPrefab('Combo',o)local w,x,y=aa:MergeMetatables(o,v),v.
Combo,(aa:DetectHover(v))local z,A,B=n:Label{Text=tostring(p),Parent=x,Name=
'ValueText'},n:ArrowButton{Parent=x,Ratio=1,Interactable=false,Size=UDim2.
fromScale(0,0),LayoutOrder=2},n:Label{Text=s,Parent=v,LayoutOrder=2}if u then aa
:SetProperties(v,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.new(0,0,0,20)})
aa:SetProperties(x,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromScale(0,1)
})end local C,D=function(C,...)local D=o.Callback o:SetOpen(false)return D(w,C,
...)end,function(C,D)local E=n:GetThemeKey'AnimationTweenInfo'v.Interactable=not
C f:HeaderCollapseToggle{Tweeninfo=E,NoAnimation=D,Collapsed=not C,Toggle=A.Icon
}end local function E()local F,G=o.GetItems,o.Items if F then return F()end
return G end function o:SetValueText(F)z.Text=tostring(F)end function o:
SetDisabled(F)self.Disabled=F v.Interactable=not F n:SetColorTags({[B]=F and
'LabelDisabled'or'Label'},true)end function o:SetValue(F)local G=E()local H=G[F]
local I=H or F self._Selected=F self.Value=I if typeof(F)=='number'then self:
SetValueText(I)else self:SetValueText(F)end return C(F,I)end function o:SetOpen(
F)local G=self._Selected self.Open=F D(F,q)if not F then if Dropdown then
Dropdown:Close()end return end Dropdown=n:Dropdown{ParentObject=x,Items=E(),
Selected=G,OnSelected=function(...)o:SetValue(...)end,OnClosed=function()self:
SetOpen(false)end}return self end local F=function()local F=o.Open o:SetOpen(not
F)end x.Activated:Connect(F)D(false,true)o:SetDisabled(t)if r then o:SetValue(r)
end aa:SetAnimation(x,'Inputs')n:TagElements{[x]='Frame'}return w,v end})local n
={TileBarConfig={Close={Image=aa.Icons.Close,IconSize=UDim2.fromOffset(11,11)},
Collapse={Image=aa.Icons.Arrow,IconSize=UDim2.fromScale(1,1)}},CloseCallback=ac,
Collapsible=true,Open=true,Focused=false}function n:Tween(o)aa:CheckConfig(o,{
Tweeninfo=self:GetThemeKey'AnimationTweenInfo'})return f:Tween(o)end function n:
TagElements(o)local p=aa.Debug if not n then if p then aa:Warn(
'No WindowClass for objects registor:',o)end return end local q,r=self.TagsList,
self.Theme aa:MultiUpdateColors{Theme=r,TagsList=q,Objects=o}end function n:
MakeTitleBarCanvas()local o=self.TitleBar local p=aa:MakeCanvas{WindowClass=self
,Element=o}self.TitleBarCanvas=p return p end function n:AddDefaultTitleButtons(
)local o,p=self.TileBarConfig,self.TitleBar local q,r,s=o.Collapse,o.Close,self.
TitleBarCanvas if not s then s=self:MakeTitleBarCanvas()end aa:CheckConfig(self,
{Toggle=s:RadioButton{Icon=q.Image,IconSize=q.IconSize,LayoutOrder=1,Ratio=1,
Size=UDim2.new(0,0),Callback=function()self:ToggleCollapsed()end},CloseButton=s:
RadioButton{Icon=r.Image,IconSize=r.IconSize,LayoutOrder=3,Ratio=1,Size=UDim2.
new(0,0),Callback=function()self:Close()end},TitleLabel=s:Label{ColorTag='Title'
,LayoutOrder=2,Size=UDim2.new(1,0),Active=false,Fill=true,AutomaticSize=Enum.
AutomaticSize.XY}})self:TagElements{[self.TitleLabel]='WindowTitle'}end function
n:Close()local o=self.CloseCallback if o then local p=o(self)if p==false then
return end end self:Remove()end function n:GetWindowSize()local o=self.
WindowFrame return o.AbsoluteSize end function n:GetTitleBarSizeY()local o=self.
TitleBar if not o.Visible then return 0 end return aa:GetContentSize(o,true).Y
end function n:SetVisible(o)local p,q=self.WindowFrame,self.NoFocusOnAppearing
self.Visible=o p.Visible=o if o and not q then aa:SetFocusedWindow(self)end
return self end function n:SetTitle(o)local p=self.TitleLabel p.Text=tostring(o)
return self end function n:Remove()local o=self.WindowFrame o:Destroy()end
function n:SetPosition(o)local p=self.WindowFrame p.Position=o return self end
function n:SetSize(o,p)local q=self.WindowFrame if typeof(o)=='Vector2'then o=
UDim2.fromOffset(o.X,o.Y)end self:Tween{Object=q,NoAnimation=p,EndProperties={
Size=o}}self.Size=o return self end function n:Center()local o=self:
GetWindowSize()/2 local p=UDim2.new(0.5,-o.X,0.5,-o.Y)self:SetPosition(p)return
self end function n:SetTheme(o)local p,q,r=aa.ThemeConfigs,self.TagsList,self.
Focused if not o then o=self.Theme end assert(p[o],`{o} is not a valid theme!`)
self.Theme=o aa:MultiUpdateColors{Animate=false,Theme=o,Objects=q}self:
SetFocused(r)return self end function n:SetFocused(o)o=o==nil and true or o self
.Focused=o if o then aa:SetFocusedWindow(self)end local p,q,r,s,t,u=self.
ContentFrame,self.TitleBar,self.Theme,self.TitleLabel,self.Collapsed,self.
WindowFrame:FindFirstChildOfClass'UIStroke'local v={Focused={[u]='BorderActive',
[q]='TitleBarBgActive',[s]={TextColor3='TitleActive'}},UnFocused={[u]='Border',[
q]='TitleBarBg',[s]={TextColor3='Title'}},Collapsed={[u]='Border',[q]=
'TitleBarBgCollapsed',[s]={TextColor3='Title'}}}local w=o and v.Focused or v.
UnFocused if t then w=v.Collapsed end aa:MultiUpdateColors{Animate=true,Objects=
w,Theme=r}end function n:GetThemeKey(o)return aa:GetThemeKey(self.Theme,o)end
function n:ResetColors()local o,p,q=aa.Theme,self.Theme,self.TagsList table.
clear(p)aa:MultiUpdateColors{Animate=false,Theme=o,Objects=q}return n end
function n:SetCollapsible(o)self.Collapsible=o return self end function n:
ToggleCollapsed(o)local p,q=self.Collapsed,self.Collapsible if not o and not q
then return self end self:SetCollapsed(not p)return self end function n:
SetCollapsed(o,p)local q,r,s,t,u,v,w,x,y=self.WindowFrame,self.Body,self.Toggle,
self.ResizeGrab,self.Size,self.AutoSize,self:GetThemeKey'AnimationTweenInfo',
self:GetWindowSize(),self:GetTitleBarSizeY()local z,A=s.Icon,UDim2.fromOffset(x.
X,y)self.Collapsed=o self:SetCollapsible(false)self:SetFocused(not o)f:
HeaderCollapse{Tweeninfo=w,NoAnimation=p,Collapsed=o,Toggle=z,Resize=q,
NoAutomaticSize=not v,Hide=r,ClosedSize=A,OpenSize=u,Completed=function()self:
SetCollapsible(true)end}self:Tween{Object=t,NoAnimation=p,EndProperties={
TextTransparency=o and 1 or 0.6,Interactable=not o}}return self end function n:
UpdateConfig(o)local p={NoTitleBar=function(p)local q=self.TitleBar q.Visible=
not p end,NoClose=function(p)local q=self.CloseButton q.Visible=not p end,
NoCollapse=function(p)local q=self.Toggle q.Visible=not p end,NoTabsBar=function
(p)local q=self.WindowTabSelector if not q then return end local r=q.TabsBar r.
Visible=not p end,NoScrollBar=function(p)local q,r,s,t=p and 0 or 9,self.
NoScroll,self.WindowTabSelector,self.ContentCanvas if s then s.Body.
ScrollBarThickness=q end if not r then t.ScrollBarThickness=q end end,
NoScrolling=function(p)local q,r,s=self.NoScroll,self.WindowTabSelector,self.
ContentCanvas if r then r.Body.ScrollingEnabled=not p end if not q then s.
ScrollingEnabled=not p end end,NoMove=function(p)local q=self.DragConnection q:
SetEnabled(not p)end,NoResize=function(p)local q=self.ResizeConnection q:
SetEnabled(not p)end,NoBackground=function(p)local q,r=self:GetThemeKey
'WindowBgTransparency',self.CanvasFrame r.BackgroundTransparency=p and 1 or q
end}Merge(self,o)for q,r in o do local s=p[q]if s then s(r)end end return self
end aa:DefineElement('Window',{Export=true,Base={Theme='DarkTheme',NoSelect=
false,NoTabs=true,NoScroll=false,Collapsed=false,Visible=true,AutoSize=false,
MinSize=Vector2.new(160,90),OpenOnDoubleClick=true,NoAutoTheme=true,
NoWindowRegistor=false,IsDragging=false},Create=function(o,p)aa:CheckConfig(p,{
Parent=aa.Container.Windows,Title=aa.DefaultTitle})local q,r,s,t,u,v,w,x,y,z,A,B
,C=aa.Windows,p.NoDefaultTitleBarButtons,p.Collapsed,p.MinSize,p.Title,p.NoTabs,
p.NoScroll,p.Theme,p.AutomaticSize,p.NoWindowRegistor,p.AutoSelectNewTabs,p.
OpenOnDoubleClick,p.NoCollapse local D={Scroll=not w,Fill=not y and true or nil,
UiPadding=UDim.new(0,v and 8 or 0),AutoSelectNewTabs=A}if y then Merge(D,{
AutomaticSize=y,Size=UDim2.new(1,0)})end local E=aa:InsertPrefab('Window',p)
local F=E.Content local G,H=F.TitleBar,NewClass(n)local I,J,K,L,M=aa:
MakeResizable{MinimumSize=t,Resize=E,OnUpdate=function(I)H:SetSize(I,true)end},(
aa:MakeCanvas{Element=F,WindowClass=H,Class=H})local N,O=J:Canvas(Copy(D,{Parent
=F}))Merge(H,p)Merge(H,{WindowFrame=E,ContentFrame=F,CanvasFrame=O,ResizeGrab=I.
Grab,TitleBar=G,Elements=g,TagsList={},ResizeConnection=I,HoverConnection=aa:
DetectHover(F),DragConnection=aa:MakeDraggable{Move=E,Grab=F,OnDragStateChange=
function(P)H.IsDragging=P O.Interactable=not P if P then aa:SetFocusedWindow(M)
end aa:SetWindowFocusesEnabled(not P)end}})if v then K,L=N,O else K,L=N:
TabSelector(D)H.WindowTabSelector=K end Merge(H,{Body=L,ContentCanvas=K})aa:
ConnectMouseEvent(F,{DoubleClick=true,OnlyMouseHovering=G,Callback=function(...)
if not H.OpenOnDoubleClick then return end if H.NoCollapse then return end H:
ToggleCollapsed()end})if not r then H:AddDefaultTitleButtons()end H:SetTitle(u)H
:SetCollapsed(s,true)H:SetTheme(x)H:UpdateConfig(p)H:SetFocused()M=aa:
MergeMetatables(H,K)if not z then table.insert(q,M)end local P=I.Grab aa:
SetAnimation(P,'TextButtons')M:TagElements{[P]='ResizeGrab',[G]='TitleBar',[O]=
'Window'}return M,E end})aa:DefineElement('TabsWindow',{Export=true,Base={NoTabs
=false,AutoSelectNewTabs=true},Create=function(o,p)return o:Window(p)end})aa:
DefineElement('PopupCanvas',{Base={Scroll=false,AutomaticSize=Enum.AutomaticSize
.Y},Create=function(o,p)local q,r=o.WindowClass,p.Scroll local s=r and
'ScrollingCanvas'or'Canvas'local t=aa:InsertPrefab(s,p)function p:ClosePopup()t:
Destroy()end function p:ShowPopup()t.Visible=true end local u,v=aa:DetectHover(t
,{MouseOnly=true,OnInput=function(u,v)if u then return end p:ClosePopup()end}),
aa:MakeCanvas{Element=t,WindowClass=q,Class=p}return v,t end})aa:DefineElement(
'PopupModal',{Export=true,Base={NoAnimation=false,NoCollapse=true,NoClose=true,
NoResize=true,NoSelect=true,NoAutoFlags=true,NoWindowRegistor=true,NoScroll=true
},Create=function(o,p)local q,r,s=o.WindowClass,(p.NoAnimation)p.Parent=aa.
Container.Overlays if q then s=q:GetThemeKey'ModalWindowDimTweenInfo'p.Theme=q.
Theme end local t=aa:InsertPrefab('ModalEffect',p)local u=o:Window(Copy(p,{
Parent=t,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size
=UDim2.fromOffset(372,38),NoAutoFlags=false,AutomaticSize=Enum.AutomaticSize.Y})
)function p:ClosePopup()f:Tween{Object=t,Tweeninfo=s,NoAnimation=r,EndProperties
={BackgroundTransparency=1},Completed=function()t:Destroy()end}u:Close()end f:
Tween{Object=t,Tweeninfo=s,NoAnimation=r,StartProperties={BackgroundTransparency
=1},EndProperties={BackgroundTransparency=0.8}}o:TagElements{[t]=
'ModalWindowDim'}local v=aa:MergeMetatables(p,u)return v,t end})local o=`rbxassetid://`
..aa.PrefabsId aa:Init{Prefabs=game:GetService'InsertService':LoadLocalAsset(o)}
return aa end function a.g()return function(aa)local ab,ac,ad,ae=a.load'a',a.
load'f',a.load'c',a.load'd'local af,ag,b,c,d,e,f=ad.team.enemy,ad.team.friendly,
ae.Aimbot,ae.Triggerbot,ae.FOVSettings,ab.SecureService,ac:TabsWindow{Title=`RIOT V2 | {
aa} - getriot.cc`,Size=UDim2.new(0,350,0,550),Position=UDim2.new(0.5,0,0,70)}
local g={Combat=f:CreateTab{Name='Combat'},Visuals=f:CreateTab{Name='Visuals'},
Settings=f:CreateTab{Name='Settings'}}local h=g.Combat:TabSelector{Size=UDim2.
new(1,0,0,310)}local i,k,l=h:CreateTab{Name='Aimbot'},{[true]=
'Active: <font color="rgb(40, 240, 10)">true</font>',[false]=
'Active: <font color="rgb(240, 40, 10)">false</font>'}local n=i:Checkbox{Label=
'Enabled',Value=false,Callback=function(n,o)b.Enabled=o if l and l.Text==k[true]
and not o then l.Text=k[false]end end}l=i:Label{RichText=true,Text=k[false]}b.
AutoStateLabel=function(o)if n.Value then l.Text=k[o]end end local o=i:Label{
RichText=true,Text='Target: <font color="rgb(240, 40, 10)">none</font>'}b.
AutoLockedLabel=function(p)o.Text=p and string.format(
'Target: <font color="rgb(40, 240, 10)">%q</font>',p.Name)or
'Target: <font color="rgb(240, 40, 10)">None</font>'end local p,q i:Combo{
Selected='Camera',Label='Lock Mode',Items={'Camera','Mouse'},Callback=function(r
,s)b.LockMode=({Camera=1,Mouse=2})[s]if p and q then p:SetDisabled(s~='Camera')q
:SetDisabled(s~='Mouse')end end}i:Keybind{Label='Trigger Keybind',Value=Enum.
KeyCode.E,OnKeybindSet=function(r,s)b.TriggerKey=s end}for r,s in ipairs{{
'Toggle Activation','ToggleTrigger',nil},{'Team Check','TeamCheck',true},{
'Alive Check','AliveCheck',true}}do i:Checkbox{Label=s[1],Value=s[3],Callback=
function(t,u)b[s[2] ]=u end}end i:Combo{Label='Wall Check',Selected='Always On',
Items={'Off','Sticky','Always On'},Callback=function(t,u)local v=table.find(t.
Items,u)if v then b.WallCheck=v end end}i:Combo{Selected='Head',Label=
'Aiming Bone',Items={'Head','Torso'},Callback=function(t,u)b.LockPart=u end}p=i:
SliderFloat{Label='Smoothing (Camera)',Minimum=0,Maximum=1,Value=0,Format=
'Smoothing = %.3f',Callback=function(t,u)b.Sensitivity=u end}q=i:SliderFloat{
Label='Smoothing (Mouse)',Minimum=1,Maximum=20,Value=1,Format='Smoothing = %.1f'
,Callback=function(t,u)b.Sensitivity2=u end}q:SetDisabled(true)local t=h:
CreateTab{Name='Triggerbot'}t:Checkbox{Label='Enabled',Value=false,Callback=
function(u,v)c.Enabled=v end}local u=t:Label{RichText=true,Text=
'Trigger Target: <font color="rgb(240, 40, 10)">none</font>'}c.TargetChanged=
function(v)if not v then u.Text=
'Trigger Target: <font color="rgb(240, 40, 10)">none</font>'else u.Text=`Trigger Target: <font color="rgb(40, 240, 10)">{
v.Name}</font>`end end for v,w in ipairs{{'Team Check','TeamCheck',true},{
'Alive Check','AliveCheck',true}}do t:Checkbox{Label=w[1],Value=w[3],Callback=
function(x,y)c[w[2] ]=y end}end t:InputInt{Label='Trigger Delay (ms)',Value=0,
Minimum=0,Increment=25,Callback=function(x,y)c.Delay=y/1000 end}g.Combat:
Separator{Text='FOV Settings'}for x,y in ipairs{{'Enabled','Enabled',true},{
'Visible','Visible',true}}do g.Combat:Checkbox{Label=y[1],Value=y[3],Callback=
function(z,A)d[y[2] ]=A end}end for z,A in ipairs{{'Radius','Radius',0,500,120,
'%.0f'},{'Circle Sides','NumSides',3,80,25,'%.0f'},{'Transparency',
'Transparency',0,1,0,'%.3f'}}do g.Combat:SliderFloat{Label=A[1],Minimum=A[3],
Maximum=A[4],Value=A[5],Format=A[1]..' = '..A[6],Callback=function(B,C)d[A[2] ]=
C end}end for B,C in ipairs{{'Color','Color',Color3.fromRGB(240,40,10)},{
'Color (Locked)','LockedColor',Color3.fromRGB(40,240,10)}}do g.Combat:DragColor3
{Label=C[1],Value=C[3],Callback=function(D,E)d[C[2] ]=E end}end g.Visuals:
Separator{Text='Shared Settings'}local D local E=g.Visuals:Checkbox{Label=
'Limit Distance',Value=false,Callback=function(E,F)ad.shared.limitDistance=F if
D then D:SetDisabled(not F)end end}D=g.Visuals:SliderFloat{Label='Limit',Minimum
=1,Maximum=500,Value=150,Format='Distance Limit = %.0f',Callback=function(F,G)ad
.shared.maxDistance=G end}D:SetDisabled(not E.Value)g.Visuals:Separator{Text=
'ESP'}local F,G=g.Visuals:TabSelector{Size=UDim2.new(1,0,0,400)},function(F,G)G:
Checkbox{Label='Enabled',Value=false,Callback=function(H,I)F.enabled=I end}G:
Separator{Text='Boxes'}G:Checkbox{Label='Enabled',Value=true,Callback=function(H
,I)F.box=I end}G:DragColor3{Value=Color3.fromRGB(77,92,143),Label='Color',
Callback=function(H,I)F.boxColor[1]=I end}G:SliderFloat{Label='Transparency',
Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(H,I)F
.boxColor[2]=1-I F.boxOutlineColor[2]=1-I end}G:Separator{Text='3D Boxes'}G:
Checkbox{Label='Enabled',Value=true,Callback=function(H,I)F.box3d=I end}G:
DragColor3{Value=Color3.fromRGB(155,205,255),Label='Color',Callback=function(H,I
)F.box3dColor[1]=I end}G:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,
Value=0,Format='Transparency = %.3f',Callback=function(H,I)F.box3dColor[2]=1-I
end}G:Separator{Text='Box Fill'}G:Checkbox{Label='Enabled',Value=true,Callback=
function(H,I)F.boxFill=I end}G:DragColor3{Value=Color3.fromRGB(0,0,0),Label=
'Color',Callback=function(H,I)F.boxFillColor[1]=I end}G:SliderFloat{Label=
'Transparency',Minimum=0,Maximum=1,Value=0.2,Format='Transparency = %.3f',
Callback=function(H,I)F.boxFillColor[2]=I end}G:Separator{Text='Chams'}G:
Checkbox{Label='Enabled',Value=true,Callback=function(H,I)F.chams=I end}G:
Checkbox{Label='Always On Top',Value=true,Callback=function(H,I)F.
chamsVisibleOnly=not I end}G:DragColor3{Value=Color3.fromRGB(100,120,250),Label=
'Color (Fill)',Callback=function(H,I)F.chamsFillColor[1]=I end}G:SliderFloat{
Label='Transparency (Fill)',Minimum=0,Maximum=1,Value=0.8,Format=
'Transparency = %.3f',Callback=function(H,I)F.chamsFillColor[2]=I end}G:
DragColor3{Value=Color3.fromRGB(25,85,255),Label='Color (Outline)',Callback=
function(H,I)F.chamsOutlineColor[1]=I end}G:SliderFloat{Label=
'Transparency (Outline)',Minimum=0,Maximum=1,Value=0.5,Format=
'Transparency = %.3f',Callback=function(H,I)F.chamsOutlineColor[2]=I end}G:
Separator{Text='Tracers'}G:Checkbox{Label='Enabled',Value=true,Callback=function
(H,I)F.tracer=I end}G:DragColor3{Value=Color3.fromRGB(77,92,143),Label='Color',
Callback=function(H,I)F.tracerColor[1]=I end}G:SliderFloat{Label='Transparency',
Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(H,I)F
.tracerColor[2]=1-I F.tracerOutlineColor[2]=1-I end}G:Combo{Selected='Top',Label
='Tracer Origin',Items={'Top','Middle','Bottom','Mouse'},Callback=function(H,I)F
.tracerOrigin=I end}G:Separator{Text='Health Bars'}G:Checkbox{Label='Enabled',
Value=true,Callback=function(H,I)F.healthBar=I end}G:DragColor3{Value=Color3.
fromRGB(58,161,47),Label='Healthy Color',Callback=function(H,I)F.healthyColor=I
end}G:DragColor3{Value=Color3.fromRGB(161,47,47),Label='Dying Color',Callback=
function(H,I)F.dyingColor=I end}G:Separator{Text='Off Screen Arrows'}G:Checkbox{
Label='Enabled',Value=true,Callback=function(H,I)F.offScreenArrow=I end}G:
DragColor3{Value=Color3.fromRGB(255,255,255),Label='Color',Callback=function(H,I
)F.offScreenArrowColor[1]=I end}G:SliderFloat{Label='Transparency',Minimum=0,
Maximum=1,Value=0,Format='Transparency = %.3f',Callback=function(H,I)F.
offScreenArrowColor[2]=1-I F.offScreenArrowOutlineColor[2]=1-I end}G:SliderInt{
Label='Size',Value=15,Minimum=1,Maximum=50,Callback=function(H,I)F.
offScreenArrowSize=I end}G:SliderInt{Label='Radius',Value=150,Minimum=1,Maximum=
800,Callback=function(H,I)F.offScreenArrowRadius=I end}G:Separator{Text='Names'}
G:Checkbox{Label='Enabled',Value=true,Callback=function(H,I)F.name=I end}G:
DragColor3{Value=Color3.fromRGB(221,215,148),Label='Color',Callback=function(H,I
)F.nameColor[1]=I end}G:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,
Value=0,Format='Transparency = %.3f',Callback=function(H,I)F.nameColor[2]=1-I
end}G:Separator{Text='Distance Text'}G:Checkbox{Label='Enabled',Value=true,
Callback=function(H,I)F.distance=I end}G:DragColor3{Value=Color3.fromRGB(221,215
,148),Label='Color',Callback=function(H,I)F.distanceColor[1]=I end}G:SliderFloat
{Label='Transparency',Minimum=0,Maximum=1,Value=0,Format='Transparency = %.3f',
Callback=function(H,I)F.distanceColor[2]=1-I end}G:Separator{Text='Weapon Text'}
G:Checkbox{Label='Weapon Text',Value=true,Callback=function(H,I)F.weapon=I end}G
:DragColor3{Value=Color3.fromRGB(200,173,182),Label='Color',Callback=function(H,
I)F.weaponColor[1]=I end}G:SliderFloat{Label='Transparency',Minimum=0,Maximum=1,
Value=0,Format='Transparency = %.3f',Callback=function(H,I)F.weaponColor[2]=1-I
end}G:Separator{Text='Health Text'}G:Checkbox{Label='Health Text',Value=true,
Callback=function(H,I)F.healthText=I end}G:DragColor3{Value=Color3.fromRGB(200,
173,182),Label='Color',Callback=function(H,I)F.healthTextColor[1]=I end}G:
SliderFloat{Label='Transparency',Minimum=0,Maximum=1,Value=0,Format=
'Transparency = %.3f',Callback=function(H,I)F.healthTextColor[2]=1-I end}end
local H=F:CreateTab{Name='Enemy'}G(af,H)local I=F:CreateTab{Name='Friendly'}G(ag
,I)g.Settings:Keybind{Label='Menu Keybind',Value=Enum.KeyCode.Home,
IgnoreGameProcessed=false,Callback=function(J,K)f:SetVisible(not f.Visible)end}
ad.Load()ae.Load()end end end local aa={newBase={Name='newBase',Load=a.load'e'},
Universal={Name='Universal',Load=a.load'g'}}for ab,ac in pairs(aa)do if ac.
Places then for ad,ae in ipairs(ac.Places)do if ae==game.PlaceId then ac:Load()
return end end end end aa.newBase:Load()
