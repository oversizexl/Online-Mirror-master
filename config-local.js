// 本地测试配置
// 使用方法：临时将此文件重命名为 config.js 即可使用本地 API

const API_BASE_URL = "http://localhost:8787";

// 短链接服务（已废弃，保留向后兼容）
const SHORT_LINK_API = "https://9lnk.io/create";

// 导出配置到全局（前端通过 window.API_CONFIG 使用）
window.API_CONFIG = {
  BASE_URL: API_BASE_URL,
  UPLOAD: `${API_BASE_URL}/api/upload`,
  PHOTOS: `${API_BASE_URL}/api/photos`,
  DELETE_PHOTOS: `${API_BASE_URL}/api/photos`,
  SHORT_LINK: SHORT_LINK_API,
};

