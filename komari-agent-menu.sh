#!/bin/bash

SERVICE_NAME="komari-agent"
SERVICE_PATH="/etc/systemd/system/${SERVICE_NAME}.service"
INSTALL_DIR="/opt/komari"

function reload_daemon() {
    echo "重新加载 systemctl daemon..."
    systemctl daemon-reexec
    systemctl daemon-reload
}

function enable_service() {
    echo "设置 ${SERVICE_NAME} 开机自启..."
    systemctl enable "$SERVICE_NAME"
}

function disable_service() {
    echo "禁用 ${SERVICE_NAME} 开机自启..."
    systemctl disable "$SERVICE_NAME"
}

function start_service() {
    echo "启动 ${SERVICE_NAME}..."
    systemctl start "$SERVICE_NAME"
}

function stop_service() {
    echo "停止 ${SERVICE_NAME}..."
    systemctl stop "$SERVICE_NAME"
}

function restart_service() {
    echo "重启 ${SERVICE_NAME}..."
    systemctl restart "$SERVICE_NAME"
}

function status_service() {
    echo "查看 ${SERVICE_NAME} 状态..."
    systemctl status "$SERVICE_NAME"
}

function logs_service() {
    echo "查看 ${SERVICE_NAME} 实时日志..."
    journalctl -f -u "$SERVICE_NAME"
}

function uninstall_agent() {
    echo "正在卸载 ${SERVICE_NAME}..."

    # 停止和禁用服务
    systemctl stop "$SERVICE_NAME"
    systemctl disable "$SERVICE_NAME"

    # 删除 systemd 服务文件
    if [ -f "$SERVICE_PATH" ]; then
        rm -f "$SERVICE_PATH"
        echo "已删除服务文件：$SERVICE_PATH"
    fi

    # 删除安装目录
    if [ -d "$INSTALL_DIR" ]; then
        echo "删除目录：$INSTALL_DIR"
        sudo rm -rf "$INSTALL_DIR"
    else
        echo "目录 $INSTALL_DIR 不存在，无需删除。"
    fi

    # 重新加载 systemd
    systemctl daemon-reload
    echo "${SERVICE_NAME} 卸载完成。"
}

function get_service_status() {
    if [ ! -f "$SERVICE_PATH" ]; then
        echo -e "状态：\033[1;33m⚠️ 未安装\033[0m"
    else
        STATUS=$(systemctl is-active "$SERVICE_NAME")
        if [ "$STATUS" == "active" ]; then
            echo -e "状态：\033[1;32m✅ 运行中\033[0m"
        elif [ "$STATUS" == "inactive" ]; then
            echo -e "状态：\033[1;31m❌ 未启动\033[0m"
        else
            echo -e "状态：\033[1;31m❌ 状态异常：$STATUS\033[0m"
        fi
    fi
}

function show_menu() {
    echo "======== Komari Agent 管理菜单 ========"
    echo "1. 重新加载 systemctl daemon"
    echo "2. 设置开机自启"
    echo "3. 禁用开机自启"
    echo "4. 启动服务"
    echo "5. 停止服务"
    echo "6. 重启服务"
    echo "7. 查看服务状态"
    echo "8. 查看服务日志"
    echo "9. 卸载 Komari Agent"
    echo "0. 退出"
    echo "======================================="
    get_service_status
    echo -n "请输入选项编号: "
}

while true; do
    show_menu
    read -r choice
    case $choice in
        1) reload_daemon ;;
        2) enable_service ;;
        3) disable_service ;;
        4) start_service ;;
        5) stop_service ;;
        6) restart_service ;;
        7) status_service ;;
        8) logs_service ;;
        9) uninstall_agent ;;
        0) echo "退出"; exit 0 ;;
        *) echo "无效的选项，请重新输入。" ;;
    esac
    echo
done
