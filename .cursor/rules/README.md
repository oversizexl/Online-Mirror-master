# Cursor Rules 说明

这个目录包含了 Online Mirror 项目的 Cursor AI 规则文件，帮助 AI 更好地理解项目结构和开发规范。

> ✅ **已迁移到新版规则格式**：本项目使用 `.cursor/rules/*.mdc` 作为规则存储方式（官方推荐），已删除已弃用的 `.cursorrules` 文件。

## 📋 规则文件列表

### 1. project-structure.mdc

**类型**: Always Apply (自动应用)  
**作用**: 项目整体结构和核心开发原则

- 核心文件功能
- 技术栈说明（前端、后端、存储、**pnpm 包管理**）
- 部署环境配置（Main 分支作为唯一生产分支）
- **最小化改动原则（奥卡姆剃刀法则）**
- **交付优先级**
- **实现规范概览**
- **重要约定**
- **禁止事项**

### 2. deployment.mdc

**类型**: Manual Apply (手动应用)  
**触发**: 部署相关问题  
**作用**: Cloudflare 部署流程和最佳实践

- 部署命令（使用 pnpm）
- **包管理**（pnpm 使用说明）
- 环境配置（Main 分支为唯一生产分支）
- **部署前检查清单**
- **代码审查清单**
- 常见问题解决

### 3. ui-components.mdc

**类型**: HTML Files (\*.html)  
**作用**: UI 组件和交互设计规范

- 禁止使用原生弹窗
- 自定义 Toast 和对话框
- 标准组件样式
- 骨架屏实现

### 4. api-config.mdc

**类型**: Manual Apply (手动应用)  
**触发**: API 相关开发  
**作用**: API 配置和请求规范

- API 地址配置
- 正确的调用方式
- 性能优化技巧
- CORS 配置

### 5. performance-security.mdc

**类型**: Manual Apply (手动应用)  
**触发**: 性能或安全相关问题  
**作用**: 性能优化和安全最佳实践

- 极速拍照实现（10ms 优化）
- 图片优化（JPEG 0.7）
- 先跳转后上传
- 现代性能优化技巧（Promise.all、IntersectionObserver、WeakMap 等）
- 代码质量规范（函数单一职责、避免嵌套过深、简洁明了）
- 安全防护与错误处理

### 6. url-encoding.mdc

**类型**: Manual Apply (手动应用)  
**触发**: URL 编码和参数处理  
**作用**: URL 编码和参数处理规范

- Base64 编码策略
- URL 长度优化（缩短 36%）
- 参数加密隐藏
- 为什么不能用 POST
- 向后兼容处理

### 7. link-generation.mdc

**类型**: Manual Apply (手动应用)  
**触发**: 链接生成相关问题  
**作用**: 链接生成和优化策略

- 直接生成原始链接（即时）
- 为什么去掉短链接
- URL 结构优化
- 生成速度优化（0ms）
- 最佳实践

### 8. shortlink-integration.mdc

**类型**: Manual Apply (手动应用)  
**触发**: 短链接集成（已废弃）  
**作用**: 短链接集成说明（历史文档，仅供参考）

> ⚠️ 此功能已废弃，项目现使用直接生成原始链接的方式

- 9lnk.io API 使用（历史）
- 集成实现（已移除）
- 降级策略
- 废弃原因说明

### 9. cache-busting.mdc

**类型**: Manual Apply (手动应用)  
**触发**: 缓存问题  
**作用**: 缓存破坏策略

- config.js 版本控制（`?v=YYYYMMDD`）
- 删除功能刷新策略
- API 请求缓存破坏
- Cloudflare CDN 缓存清除

## 📚 规则文件索引

| 文件名 | 类型 | 主要内容 |
|--------|------|----------|
| [project-structure.mdc](mdc:project-structure.mdc) | Always Apply | 项目结构、技术栈、部署环境 |
| [deployment.mdc](mdc:deployment.mdc) | Manual Apply | 部署命令、环境配置、常见问题 |
| [ui-components.mdc](mdc:ui-components.mdc) | HTML Files | UI 组件、交互规范、骨架屏 |
| [api-config.mdc](mdc:api-config.mdc) | Manual Apply | API 配置、调用规范、CORS |
| [performance-security.mdc](mdc:performance-security.mdc) | Manual Apply | 性能优化、代码质量、安全防护 |
| [url-encoding.mdc](mdc:url-encoding.mdc) | Manual Apply | URL 编码、Base64 策略、兼容性 |
| [link-generation.mdc](mdc:link-generation.mdc) | Manual Apply | 链接生成、优化策略、最佳实践 |
| [shortlink-integration.mdc](mdc:shortlink-integration.mdc) | Manual Apply | 短链接集成（已废弃，历史文档） |
| [cache-busting.mdc](mdc:cache-busting.mdc) | Manual Apply | 缓存控制、版本管理、刷新策略 |

## 🎯 使用方法

### Cursor AI 自动使用

- `project-structure.mdc` 会在每次对话时自动加载
- `ui-components.mdc` 会在编辑 HTML 文件时自动加载

### 手动引用规则

在 Cursor 对话中使用 `@` 符号引用规则：

```
@deployment 如何部署到 main 分支（生产环境）？
@api-config 如何正确调用 API？
@performance-security 如何优化拍照速度？
@url-encoding URL 参数如何编码？
@link-generation 如何生成链接？
```

## 📝 文档管理规范

### 维护原则

1. **先搜后写**：新建文档前先检索并更新已有内容
2. **统一存放**：所有规则文档集中在 `.cursor/rules/` 目录
3. **维护索引**：保持本 README 作为入口索引，方便导航
4. **简洁实用**：内容精简，突出可操作性
5. **及时清理**：废弃的功能标注清楚，避免误导

### 脚本管理规范

- **统一目录**：所有脚本放在 `scripts/` 目录
- **可复用的**：更新 `scripts/README.md` 索引
- **临时的**：测试完成后及时清理
- **新增的**：必须更新索引和 `package.json` scripts

### 规则文件更新指南

当项目发生重大变更时，记得更新相关规则：

1. **新增功能** → 更新 `project-structure.mdc`
2. **部署流程变更** → 更新 `deployment.mdc`
3. **UI 组件变更** → 更新 `ui-components.mdc`
4. **API 变更** → 更新 `api-config.mdc`
5. **性能/安全优化** → 更新 `performance-security.mdc`
6. **URL 编码变更** → 更新 `url-encoding.mdc`
7. **链接生成策略** → 更新 `link-generation.mdc`

## 🔄 规则更新历史

- **2025-11-04**: 📦 **更新包管理为 pnpm**，所有文档统一使用 pnpm 命令
- **2025-11-04**: 明确 Main 分支为唯一生产分支（无其他分支）
- **2025-11-04**: 🎯 **迁移到新版规则格式**，删除已弃用的 `.cursorrules`
- **2025-11-04**: 将核心开发原则、交付优先级、实现规范整合到 `project-structure.mdc`
- **2025-11-04**: 将代码审查清单整合到 `deployment.mdc`
- **2025-11-04**: 添加现代性能优化技巧和代码质量规范到 `performance-security.mdc`
- **2025-11-04**: 新增文档管理规范和脚本管理规范
- **2025-10-29**: 初始版本，基于项目重构后的最佳实践创建
- **2025-10-29**: 新增 `url-encoding.mdc` 和 `link-generation.mdc`
- **2025-10-29**: 更新 `performance-security.mdc` - 添加 10ms 极速优化、JPEG 0.7、先跳转后上传等最新实践
- **2025-10-29**: 去掉短链接服务，优化为直接生成原始链接（即时，0 延迟）
