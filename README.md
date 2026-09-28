# NetCo4: server Thiên Long Bát Bộ 3D

Server riêng cho nhóm bạn, chỉ cày, không nạp.

- `server/`: script Lua, bảng dữ liệu, cấu hình của server (bản sao từ VPS). **Sửa ở đây.**
- `deploy/`: script vận hành trên VPS (bật/tắt, tài khoản, GM, sao lưu, deploy). Hướng dẫn: [deploy/HUONG-DAN-VPS.md](deploy/HUONG-DAN-VPS.md)
- `deploy/client/`: script sửa client và hướng dẫn cho người chơi
- `docs/`: [hướng dẫn làm event/NPC/drop](docs/PHAT-TRIEN.md), [những gì đã vá](docs/KIEM-TOAN.md), danh mục vật phẩm, lệnh GM
- `tools/vn.py`: đổi chữ tiếng Việt sang bảng mã của game
- [CLAUDE.md](CLAUDE.md): ghi chú cho Claude Code. **Đọc trước khi sửa.**

Quy trình: sửa `server/` → commit, push → trên VPS: `cd /opt/tlbb-deploy && ./cap-nhat.sh`
