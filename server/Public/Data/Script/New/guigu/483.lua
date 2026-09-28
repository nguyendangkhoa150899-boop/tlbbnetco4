--Chú ý :

--Vật phẩm Kỹ năng Của Logic Chỉ có thể Sử dụng Cơ sở Kỹ năng cùng Kịch bản gốc Lai Thực hiện 


--Kịch bản gốc:

--Dưới Thị Kịch bản gốc Dạng Lệ:


--3550.lua
------------------------------------------------------------------------------------------
--Giống nhau Vật phẩm Của Cam chịu Kịch bản gốc 

--Kịch bản gốc Hào 
x760483_g_scriptId = 760483 --Lâm thời Tả Cái này,Chân chính Dùng Thời điểm Nhất định phải Cải.

--Yêu cầu Cấp bậc 
x760483_g_levelRequire = 1
--AEPhạm vi Bán kính 
x760483_g_radiusAE = 3.0
--AECủa Mục tiêu Quan hệ Tiêu ký 
x760483_g_standFlag = 1 -- 2:Đội hữu , 1:Quân đội bạn , -1:Quân địch 
--AEẢnh hưởng Số lượng Hạn chế 
x760483_g_effectCount = 4 -- -1:Bất Hạn chế 
--Hiệu quả ID
x760483_g_Impact1 = 2728 --Lâm thời Tả Cái này 
x760483_g_Impact2 = -1 --Không cần 

--**********************************
--Sự kiện Lẫn nhau Nhập khẩu 
--**********************************
function x760483_OnDefaultEvent(sceneId, selfId, bagIndex)
-- Không cần Cái này Tiếp lời ,Đãn Yếu Giữ lại Không Hàm số 
end

--**********************************
--Cái này Vật phẩm Của Sử dụng quá trình Hay không Cùng loại với Kỹ năng :
--Hệ thống Hội Ở chấp hành Bắt đầu khi Kiểm tra đo lường Cái này Hàm số Của Phản hồi Trị ,Nếu Phản hồi Thất bại Tắc Xem nhẹ Mặt sau Cùng loại Kỹ năng Của Chấp hành .
--Phản hồi 1:Kỹ năng Cùng loại Vật phẩm ,Có thể Tiếp tục Cùng loại Kỹ năng Của Chấp hành ;Phản hồi 0:Xem nhẹ Mặt sau Thao tác .
--**********************************
function x760483_IsSkillLikeScript(sceneId, selfId)
	return 1; --Cái này Cước Bổn yêu cầu Động tác Duy trì 
end

--**********************************
--Trực tiếp Hủy bỏ Hiệu quả :
--Hệ thống Sẽ trực tiếp Thuyên chuyển Cái này Tiếp lời ,Tịnh Căn cứ Cái này Hàm số Của Phản hồi Trị Xác định Về sau Lưu trình Hay không Chấp hành .
--Phản hồi 1:Đã Hủy bỏ Đối ứng Hiệu quả ,Không hề Chấp hành Kế tiếp Thao tác ;Phản hồi 0:Không có Kiểm tra đo lường Đến Tương quan Hiệu quả ,Tiếp tục Chấp hành .
--**********************************
function x760483_CancelImpacts(sceneId, selfId)
	return 0; --Không cần Cái này Tiếp lời ,Đãn Yếu Giữ lại Không Hàm số,Hơn nữa Trước sau Phản hồi 0.
end

--**********************************
--Điều kiện Kiểm tra đo lường Nhập khẩu :
--Hệ thống Sẽ ở Kỹ năng Kiểm tra đo lường Của Thời gian Điểm Thuyên chuyển Cái này Tiếp lời ,Tịnh Căn cứ Cái này Hàm số Của Phản hồi Trị Xác định Về sau Lưu trình Hay không Chấp hành .
--Phản hồi 1:Điều kiện Kiểm tra đo lường Thông qua ,Có thể Tiếp tục Chấp hành ;Phản hồi 0:Điều kiện Kiểm tra đo lường Thất bại ,Gián đoạn Kế tiếp Chấp hành .
--**********************************
function x760483_OnConditionCheck(sceneId, selfId)
	--Kiểm tra Sử dụng Vật phẩm 
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if(0<=targetId) then
		-- Mục tiêu Cần thiết là Quân đội bạn Của Kiểm tra đo lường 
		if(1~=LuaFnUnitIsFriend(sceneId, selfId, targetId)) then
			SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
		end
		-- Mục tiêu Cần thiết là Quân địch Của Kiểm tra đo lường 
--		if(1~=LuaFnUnitIsEnemy(sceneId, selfId, targetId)) then
--			SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- Mục tiêu Cần thiết là Đội hữu Của Kiểm tra đo lường 
--		if(1~=LuaFnUnitIsPartner(sceneId, selfId, targetId)) then
--			SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- Mục tiêu Cấp bậc Kiểm tra đo lường 
--		if(g_LevelRequire<=LuaFnGetLevel(sceneId, targetId)) then
--			SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
--		if(g_LevelRequire>=LuaFnGetLevel(sceneId, targetId)) then
--			SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end

	end
	
	return 1; --Không cần Bất luận cái gì điều kiện ,Hơn nữa Trước sau Phản hồi 1.
end

--**********************************
--Tiêu hao Kiểm tra đo lường Cập Xử lý Nhập khẩu :
--Hệ thống Sẽ ở Kỹ năng Tiêu Háo thời gian Điểm Thuyên chuyển Cái này Tiếp lời ,Tịnh Căn cứ Cái này Hàm số Của Phản hồi Trị Xác định Về sau Lưu trình Hay không Chấp hành .
--Phản hồi 1:Tiêu hao Xử lý Thông qua ,Có thể Tiếp tục Chấp hành ;Phản hồi 0:Tiêu hao Kiểm tra đo lường Thất bại ,Gián đoạn Kế tiếp Chấp hành .
--Chú ý :Giá Không riêng Phụ trách Tiêu hao Kiểm tra đo lường Cũng phụ trách Tiêu hao Chấp hành .
--**********************************
function x760483_OnDeplete(sceneId, selfId)
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--Chỉ biết Chấp hành Một lần Nhập khẩu :
--Tụ khí Hòa Thuấn phát Kỹ năng Hội Ở tiêu hao Hoàn thành sau Thuyên chuyển Cái này Tiếp lời (Tụ khí Kết thúc Hơn nữa Các loại Điều kiện Đô Thỏa mãn Thời điểm ),Nhi Dẫn đường 
--Kỹ năng Cũng sẽ ở Tiêu hao xong Thành Hậu Thuyên chuyển Cái này Tiếp lời (Kỹ năng Của Ngay từ đầu ,Tiêu hao Thành công Chấp hành Lúc sau ).
--Phản hồi 1:Xử lý Thành công ;Phản hồi 0:Xử lý Thất bại .
--Chú :Nơi này là Kỹ năng Có hiệu lực Một lần Nhập khẩu 
--**********************************
function x760483_OnActivateOnce(sceneId, selfId)
	if(-1~=x760483_g_Impact1) then
		--Cấp chính mình Gia Hiệu quả 
--		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x760483_g_Impact1, 0);
		--Cấp Mục tiêu Gia Hiệu quả 
		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
		if(0<=targetId) then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x760483_g_Impact1, 0);
		end
		--Chính mình Chung quanh AE
--		local posX,posZ = LuaFnGetUnitPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x760483_g_radiusAE, x760483_g_standFlag, x760483_g_levelRequire, x760483_g_effectCount, x760483_g_Impact1, 0)
		--Chỉ định địa điểm Chung quanh AE
--		local posX,posZ = LuaFnGetTargetPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x760483_g_radiusAE, x760483_g_standFlag, x760483_g_levelRequire, x760483_g_effectCount, x760483_g_Impact1, 0)
		--Mục tiêu Thân thể Chung quanh AE
--		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
--		if(0<=targetId) then
--			local posX,posZ = LuaFnGetUnitPosition(sceneId, targetId)
--			LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x760483_g_radiusAE, x760483_g_standFlag, x760483_g_levelRequire, x760483_g_effectCount, x760483_g_Impact1, 0)
--		end
		

	end
	return 1;
end

--**********************************
--Dẫn đường Tim đập Xử lý Nhập khẩu :
--Dẫn đường Kỹ năng Sẽ ở Mỗi lần Tim đập Kết thúc Điệu hát thịnh hành Dụng Cái này Tiếp lời .
--Phản hồi :1Tiếp tục Lần sau Tim đập ;0:Gián đoạn Dẫn đường .
--Chú :Nơi này là Kỹ năng Có hiệu lực Một lần Nhập khẩu 
--**********************************
function x760483_OnActivateEachTick(sceneId, selfId)
	return 1; --Không phải Dẫn đường Tính Kịch bản gốc, Chỉ Giữ lại Không Hàm số.
end
