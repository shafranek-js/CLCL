/*
 * CLCL Installer
 *
 * Installer.h
 *
 * Copyright (C) 1996-2026 by Ohno Tomoaki. All rights reserved.
 *		https://www.nakka.com/
 *		nakka@nakka.com
 */

#ifndef _INC_CLCL_INSTALLER_H
#define _INC_CLCL_INSTALLER_H

/* Define */
#define BUF_SIZE						256

#define APP_NAME						TEXT("CLCL Next")
#define APP_EXE							TEXT("CLCLNext.exe")
#define APP_PUBLISHER					TEXT("CLCL Next contributors")
#define APP_URL							TEXT("https://github.com/shafranek-js/CLCL")
#define APP_DATA_FOLDER					TEXT("CLCLNext")

// CLCL本体の常駐確認用
#define MAIN_WND_CLASS					TEXT("CLCLNextMain")
#define MAIN_WINDOW_TITLE				TEXT("CLCL Next")

// インストール先の既定フォルダ名
#define DEFAULT_FOLDER					TEXT("CLCLNext")
// インストール先に配置するアンインストーラ
#define UNINSTALL_EXE					TEXT("CLCLNextUninstall.exe")
// インストールしたファイルの一覧
#define UNINSTALL_LOG					TEXT("clclnext-uninstall.dat")
// 以前のインストーラがインストール先に残すファイルの一覧
#define OLD_INSTALL_LOG					TEXT("clclnext-legacy-install.dat")
// 使用中で上書きできないファイルを退避するときの拡張子
#define OLD_FILE_EXT					TEXT(".old")

// アプリの一覧への登録先
#define UNINSTALL_KEY					TEXT("Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall")
#define UNINSTALL_SUBKEY				TEXT("CLCLNext")

// コマンドラインオプション
#define CMD_UNINSTALL					TEXT("/uninstall")
#define CMD_UNINSTALL_RUN				TEXT("/uninstallrun")
#define CMD_DELETE_DATA					TEXT("/deletedata")
#define CMD_PID							TEXT("/pid:")

/* Struct */
// アプリの一覧の登録場所
typedef struct _REG_TARGET {
	HKEY root;									// HKEY_LOCAL_MACHINE / HKEY_CURRENT_USER
	REGSAM view;								// KEY_WOW64_32KEY / KEY_WOW64_64KEY
	TCHAR subkey[BUF_SIZE];						// Uninstall配下のキー名
} REG_TARGET;

// 可変長の文字列バッファ
typedef struct _STR_BUF {
	TCHAR *buf;
	DWORD len;									// 格納済みの文字数
	DWORD size;									// 確保済みの文字数
} STR_BUF;

#endif
/* End of source */
