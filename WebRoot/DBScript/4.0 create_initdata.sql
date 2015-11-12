--
-- 转存表中的数据 `t_tgks_common_user`
--

INSERT INTO `t_tgks_common_user` (`id`, `username`, `password`, `status`, `type`, `email`, `name`, `sex`, `groupid`, `createtime`) VALUES
('UMSX20141206012303000001', 'KRSMA', '123456', '1', '0', 'KRSMA', 'KRSMA', '0', NULL, '2014-12-05 17:23:03');


--
-- 转存表中的数据 `t_tgks_common_menu`
--

INSERT INTO `t_tgks_common_menu` (`id`, `preid`, `name`, `status`, `url`, `level`, `sort`) VALUES
('COMM20141205024116000001', '0', 'MARZ管理系统', '1', '#', '1', '3300'),
('COMM20141206020826000000', 'COMM20141205024116000001', '招待卡密管理', '1', '../mar/passwordCardManager.action', '2', '3300'),
('COMM20141206020826000001', 'COMM20141205024116000001', '乖离卡牌管理', '1', '../mar/krsmaCardManager.action', '2', '3301'),
('COMM20141206020826000002', 'COMM20141205024116000001', '初始账号管理', '1', '../mar/accountManager.action', '2', '3302'),
('COMM20141206020826000003', 'COMM20141205024116000001', '挂机账号管理', '1', '../mar/marzAccountManager.action', '2', '3303'),
('COMM20141206020826000004', 'COMM20141205024116000001', '挂机地图管理', '1', '../mar/marzMapManager.action', '2', '3304'),
('COMM20141206020826000005', 'COMM20141205024116000001', '挂机点卡管理', '1', '../mar/marzCardManager.action', '2', '3305'),
('COMM20141206020826000006', 'COMM20141205024116000001', '挂机物品管理', '1', '../mar/marzItemManager.action', '2', '3306'),
('COMM20141206020826000011', 'COMM20141205024116000001', '挂机日志管理', '1', '../mar/marzLogManager.action', '2', '3311'),
('COMM20141206020826000023', 'COMM20141205024116000001', '挂机公告管理', '1', '../mar/marzNoticeManager.action', '2', '3323'),
('COMM20141206020826000024', 'COMM20141205024116000001', '挂机服务器管理', '1', '../mar/marzServerManager.action', '2', '3324'),
('COMM20141206020826000025', 'COMM20141205024116000001', '挂机池管理', '1', '../mar/marzThreadPoolManager.action', '2', '3325');

