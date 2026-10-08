// Duong dan dung chung cho bo cong cu pet3d. Doi bang bien moi truong neu may khac:
//   TLBB_CLIENT = thu muc client (co Data/Model.axp, Bin/...)   GHEPNGOC_JS = file ghepngoc.js cua bot (lay danh sach trung)
const path = require('path');
const REPO = path.join(__dirname, '..', '..');   // repo game (github-repo)
const NETCO4 = path.join(REPO, '..');
module.exports = {
  REPO,
  KHOA: path.join(__dirname, 'khoa'),
  CLIENT: process.env.TLBB_CLIENT || path.join(NETCO4, 'Thien Long 3D', 'Thien Long Gate'),
  get DATA() { return path.join(this.CLIENT, 'Data'); },
  GHEPNGOC_JS: process.env.GHEPNGOC_JS || path.join(NETCO4, 'bialk', 'BotDoMin', 'ghepngoc.js'),
};
