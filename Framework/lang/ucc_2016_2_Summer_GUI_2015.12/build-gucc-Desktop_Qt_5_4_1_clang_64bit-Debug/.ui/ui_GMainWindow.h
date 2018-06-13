/********************************************************************************
** Form generated from reading UI file 'GMainWindow.ui'
**
** Created by: Qt User Interface Compiler version 5.4.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_GMAINWINDOW_H
#define UI_GMAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QListWidget>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QSplitter>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_GMainWindowClass
{
public:
    QAction *actionOpen_File;
    QAction *actionExit;
    QAction *actionUser_Manual;
    QAction *actionAbout;
    QAction *actionEdit_Extensions;
    QAction *actionRelease_Notes;
    QAction *actionLicense;
    QWidget *centralwidget;
    QVBoxLayout *verticalLayout_10;
    QSplitter *splitter;
    QWidget *layoutWidget;
    QVBoxLayout *verticalLayout_2;
    QVBoxLayout *verticalLayout;
    QLabel *lblFilesA;
    QListWidget *lwFileListA;
    QHBoxLayout *horizontalLayout;
    QSpacerItem *horizontalSpacer;
    QPushButton *btnAddFileA;
    QLabel *lblAddFileA;
    QPushButton *btnRemoveFileA;
    QLabel *lblRemoveFileA;
    QPushButton *btnAddFolderA;
    QLabel *lblAddFolderA;
    QSpacerItem *horizontalSpacer_2;
    QWidget *layoutWidget1;
    QVBoxLayout *verticalLayout_7;
    QVBoxLayout *verticalLayout_5;
    QLabel *lblFilesB;
    QListWidget *lwFileListB;
    QHBoxLayout *horizontalLayout_2;
    QSpacerItem *horizontalSpacer_3;
    QPushButton *btnAddFileB;
    QLabel *lblAddFileB;
    QPushButton *btnRemoveFileB;
    QLabel *lblRemoveFileB;
    QPushButton *btnAddFolderB;
    QLabel *lblAddFolderB;
    QSpacerItem *horizontalSpacer_4;
    QWidget *layoutWidget2;
    QVBoxLayout *verticalLayout_8;
    QVBoxLayout *verticalLayout_6;
    QLabel *lblExtensionList;
    QListWidget *lwExtensionList;
    QHBoxLayout *horizontalLayout_3;
    QSpacerItem *horizontalSpacer_8;
    QPushButton *btnClearSelExt;
    QLabel *lblClearSelExt;
    QSpacerItem *horizontalSpacer_7;
    QGroupBox *bgrpOptions;
    QCheckBox *chkDupThreshold;
    QCheckBox *chkDifferencing;
    QCheckBox *chkModThreshold;
    QLineEdit *txtModThreshold;
    QCheckBox *chkTruncThreshold;
    QCheckBox *chkVisualDiffResult;
    QLineEdit *txtTruncThreshold;
    QLineEdit *txtDupThreshold;
    QGroupBox *grpbProcessing;
    QVBoxLayout *verticalLayout_4;
    QCheckBox *chkProcDuplicates;
    QCheckBox *chkProcComplexity;
    QCheckBox *chkWarnings;
    QGroupBox *grpbOutputFormat;
    QVBoxLayout *verticalLayout_3;
    QRadioButton *rdoCSVOutput;
    QRadioButton *rdoAsciiOutput;
    QRadioButton *rdoLegacyOutput;
    QCheckBox *chkUnifiedOut;
    QCheckBox *chkCc4Enable;
    QCheckBox *chkRamLimit;
    QLineEdit *txtRamLimit;
    QCheckBox *chkThreads;
    QLineEdit *txtThreads;
    QWidget *layoutWidget3;
    QGridLayout *gridLayout;
    QLabel *lblOutputDir;
    QLineEdit *txtOutputDir;
    QPushButton *btnBrowseOutputDir;
    QCheckBox *chkExtensionFile;
    QLineEdit *txtExtensionFile;
    QPushButton *btnBrowseExtensionFile;
    QCheckBox *chkProcLinks;
    QCheckBox *chkClearCaseFiles;
    QCheckBox *chkUncounted;
    QHBoxLayout *horizontalLayout_4;
    QVBoxLayout *verticalLayout_9;
    QPushButton *btnStart;
    QPushButton *btnStop;
    QTextEdit *txtMessages;
    QMenuBar *menubar;
    QMenu *menuAbout;
    QMenu *menuHelp;
    QStatusBar *statusBar;

    void setupUi(QMainWindow *GMainWindowClass)
    {
        if (GMainWindowClass->objectName().isEmpty())
            GMainWindowClass->setObjectName(QStringLiteral("GMainWindowClass"));
        GMainWindowClass->resize(1148, 683);
        QIcon icon;
        icon.addFile(QStringLiteral(":/images/gucc.png"), QSize(), QIcon::Normal, QIcon::Off);
        GMainWindowClass->setWindowIcon(icon);
        actionOpen_File = new QAction(GMainWindowClass);
        actionOpen_File->setObjectName(QStringLiteral("actionOpen_File"));
        QIcon icon1;
        icon1.addFile(QStringLiteral(":/images/open.png"), QSize(), QIcon::Normal, QIcon::Off);
        actionOpen_File->setIcon(icon1);
        actionExit = new QAction(GMainWindowClass);
        actionExit->setObjectName(QStringLiteral("actionExit"));
        QIcon icon2;
        icon2.addFile(QStringLiteral(":/images/close.png"), QSize(), QIcon::Normal, QIcon::Off);
        actionExit->setIcon(icon2);
        actionUser_Manual = new QAction(GMainWindowClass);
        actionUser_Manual->setObjectName(QStringLiteral("actionUser_Manual"));
        QIcon icon3;
        icon3.addFile(QStringLiteral(":/images/help.png"), QSize(), QIcon::Normal, QIcon::Off);
        actionUser_Manual->setIcon(icon3);
        actionAbout = new QAction(GMainWindowClass);
        actionAbout->setObjectName(QStringLiteral("actionAbout"));
        actionEdit_Extensions = new QAction(GMainWindowClass);
        actionEdit_Extensions->setObjectName(QStringLiteral("actionEdit_Extensions"));
        QIcon icon4;
        icon4.addFile(QStringLiteral(":/images/edit.png"), QSize(), QIcon::Normal, QIcon::Off);
        actionEdit_Extensions->setIcon(icon4);
        actionRelease_Notes = new QAction(GMainWindowClass);
        actionRelease_Notes->setObjectName(QStringLiteral("actionRelease_Notes"));
        actionLicense = new QAction(GMainWindowClass);
        actionLicense->setObjectName(QStringLiteral("actionLicense"));
        centralwidget = new QWidget(GMainWindowClass);
        centralwidget->setObjectName(QStringLiteral("centralwidget"));
        verticalLayout_10 = new QVBoxLayout(centralwidget);
        verticalLayout_10->setObjectName(QStringLiteral("verticalLayout_10"));
        splitter = new QSplitter(centralwidget);
        splitter->setObjectName(QStringLiteral("splitter"));
        splitter->setOrientation(Qt::Horizontal);
        layoutWidget = new QWidget(splitter);
        layoutWidget->setObjectName(QStringLiteral("layoutWidget"));
        verticalLayout_2 = new QVBoxLayout(layoutWidget);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        verticalLayout_2->setContentsMargins(0, 0, 0, 0);
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        lblFilesA = new QLabel(layoutWidget);
        lblFilesA->setObjectName(QStringLiteral("lblFilesA"));

        verticalLayout->addWidget(lblFilesA);

        lwFileListA = new QListWidget(layoutWidget);
        lwFileListA->setObjectName(QStringLiteral("lwFileListA"));
        lwFileListA->setContextMenuPolicy(Qt::CustomContextMenu);
        lwFileListA->setSelectionMode(QAbstractItemView::ExtendedSelection);

        verticalLayout->addWidget(lwFileListA);


        verticalLayout_2->addLayout(verticalLayout);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        btnAddFileA = new QPushButton(layoutWidget);
        btnAddFileA->setObjectName(QStringLiteral("btnAddFileA"));
        QIcon icon5;
        icon5.addFile(QStringLiteral(":/images/plus_sign.png"), QSize(), QIcon::Normal, QIcon::Off);
        btnAddFileA->setIcon(icon5);
        btnAddFileA->setIconSize(QSize(22, 22));

        horizontalLayout->addWidget(btnAddFileA);

        lblAddFileA = new QLabel(layoutWidget);
        lblAddFileA->setObjectName(QStringLiteral("lblAddFileA"));

        horizontalLayout->addWidget(lblAddFileA);

        btnRemoveFileA = new QPushButton(layoutWidget);
        btnRemoveFileA->setObjectName(QStringLiteral("btnRemoveFileA"));
        btnRemoveFileA->setEnabled(true);
        QIcon icon6;
        icon6.addFile(QStringLiteral(":/images/minus_sign.png"), QSize(), QIcon::Normal, QIcon::Off);
        btnRemoveFileA->setIcon(icon6);
        btnRemoveFileA->setIconSize(QSize(22, 22));

        horizontalLayout->addWidget(btnRemoveFileA);

        lblRemoveFileA = new QLabel(layoutWidget);
        lblRemoveFileA->setObjectName(QStringLiteral("lblRemoveFileA"));

        horizontalLayout->addWidget(lblRemoveFileA);

        btnAddFolderA = new QPushButton(layoutWidget);
        btnAddFolderA->setObjectName(QStringLiteral("btnAddFolderA"));
        QIcon icon7;
        icon7.addFile(QStringLiteral(":/images/add_folder.png"), QSize(), QIcon::Normal, QIcon::Off);
        btnAddFolderA->setIcon(icon7);
        btnAddFolderA->setIconSize(QSize(22, 22));

        horizontalLayout->addWidget(btnAddFolderA);

        lblAddFolderA = new QLabel(layoutWidget);
        lblAddFolderA->setObjectName(QStringLiteral("lblAddFolderA"));

        horizontalLayout->addWidget(lblAddFolderA);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_2);


        verticalLayout_2->addLayout(horizontalLayout);

        splitter->addWidget(layoutWidget);
        layoutWidget1 = new QWidget(splitter);
        layoutWidget1->setObjectName(QStringLiteral("layoutWidget1"));
        verticalLayout_7 = new QVBoxLayout(layoutWidget1);
        verticalLayout_7->setObjectName(QStringLiteral("verticalLayout_7"));
        verticalLayout_7->setContentsMargins(0, 0, 0, 0);
        verticalLayout_5 = new QVBoxLayout();
        verticalLayout_5->setObjectName(QStringLiteral("verticalLayout_5"));
        lblFilesB = new QLabel(layoutWidget1);
        lblFilesB->setObjectName(QStringLiteral("lblFilesB"));

        verticalLayout_5->addWidget(lblFilesB);

        lwFileListB = new QListWidget(layoutWidget1);
        lwFileListB->setObjectName(QStringLiteral("lwFileListB"));
        lwFileListB->setContextMenuPolicy(Qt::CustomContextMenu);
        lwFileListB->setSelectionMode(QAbstractItemView::ExtendedSelection);

        verticalLayout_5->addWidget(lwFileListB);


        verticalLayout_7->addLayout(verticalLayout_5);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        horizontalSpacer_3 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer_3);

        btnAddFileB = new QPushButton(layoutWidget1);
        btnAddFileB->setObjectName(QStringLiteral("btnAddFileB"));
        btnAddFileB->setIcon(icon5);
        btnAddFileB->setIconSize(QSize(22, 22));

        horizontalLayout_2->addWidget(btnAddFileB);

        lblAddFileB = new QLabel(layoutWidget1);
        lblAddFileB->setObjectName(QStringLiteral("lblAddFileB"));

        horizontalLayout_2->addWidget(lblAddFileB);

        btnRemoveFileB = new QPushButton(layoutWidget1);
        btnRemoveFileB->setObjectName(QStringLiteral("btnRemoveFileB"));
        btnRemoveFileB->setEnabled(true);
        btnRemoveFileB->setIcon(icon6);
        btnRemoveFileB->setIconSize(QSize(22, 22));

        horizontalLayout_2->addWidget(btnRemoveFileB);

        lblRemoveFileB = new QLabel(layoutWidget1);
        lblRemoveFileB->setObjectName(QStringLiteral("lblRemoveFileB"));

        horizontalLayout_2->addWidget(lblRemoveFileB);

        btnAddFolderB = new QPushButton(layoutWidget1);
        btnAddFolderB->setObjectName(QStringLiteral("btnAddFolderB"));
        btnAddFolderB->setIcon(icon7);
        btnAddFolderB->setIconSize(QSize(22, 22));

        horizontalLayout_2->addWidget(btnAddFolderB);

        lblAddFolderB = new QLabel(layoutWidget1);
        lblAddFolderB->setObjectName(QStringLiteral("lblAddFolderB"));

        horizontalLayout_2->addWidget(lblAddFolderB);

        horizontalSpacer_4 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer_4);


        verticalLayout_7->addLayout(horizontalLayout_2);

        splitter->addWidget(layoutWidget1);
        layoutWidget2 = new QWidget(splitter);
        layoutWidget2->setObjectName(QStringLiteral("layoutWidget2"));
        verticalLayout_8 = new QVBoxLayout(layoutWidget2);
        verticalLayout_8->setObjectName(QStringLiteral("verticalLayout_8"));
        verticalLayout_8->setContentsMargins(0, 0, 0, 0);
        verticalLayout_6 = new QVBoxLayout();
        verticalLayout_6->setObjectName(QStringLiteral("verticalLayout_6"));
        lblExtensionList = new QLabel(layoutWidget2);
        lblExtensionList->setObjectName(QStringLiteral("lblExtensionList"));

        verticalLayout_6->addWidget(lblExtensionList);

        lwExtensionList = new QListWidget(layoutWidget2);
        lwExtensionList->setObjectName(QStringLiteral("lwExtensionList"));
        lwExtensionList->setSelectionMode(QAbstractItemView::ExtendedSelection);

        verticalLayout_6->addWidget(lwExtensionList);


        verticalLayout_8->addLayout(verticalLayout_6);

        horizontalLayout_3 = new QHBoxLayout();
        horizontalLayout_3->setObjectName(QStringLiteral("horizontalLayout_3"));
        horizontalSpacer_8 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_3->addItem(horizontalSpacer_8);

        btnClearSelExt = new QPushButton(layoutWidget2);
        btnClearSelExt->setObjectName(QStringLiteral("btnClearSelExt"));
        btnClearSelExt->setIcon(icon6);
        btnClearSelExt->setIconSize(QSize(22, 22));

        horizontalLayout_3->addWidget(btnClearSelExt);

        lblClearSelExt = new QLabel(layoutWidget2);
        lblClearSelExt->setObjectName(QStringLiteral("lblClearSelExt"));

        horizontalLayout_3->addWidget(lblClearSelExt);

        horizontalSpacer_7 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_3->addItem(horizontalSpacer_7);


        verticalLayout_8->addLayout(horizontalLayout_3);

        splitter->addWidget(layoutWidget2);

        verticalLayout_10->addWidget(splitter);

        bgrpOptions = new QGroupBox(centralwidget);
        bgrpOptions->setObjectName(QStringLiteral("bgrpOptions"));
        bgrpOptions->setMinimumSize(QSize(500, 200));
        chkDupThreshold = new QCheckBox(bgrpOptions);
        chkDupThreshold->setObjectName(QStringLiteral("chkDupThreshold"));
        chkDupThreshold->setGeometry(QRect(10, 230, 151, 21));
        chkDifferencing = new QCheckBox(bgrpOptions);
        chkDifferencing->setObjectName(QStringLiteral("chkDifferencing"));
        chkDifferencing->setGeometry(QRect(10, 97, 111, 17));
        chkModThreshold = new QCheckBox(bgrpOptions);
        chkModThreshold->setObjectName(QStringLiteral("chkModThreshold"));
        chkModThreshold->setEnabled(false);
        chkModThreshold->setGeometry(QRect(10, 121, 151, 17));
        txtModThreshold = new QLineEdit(bgrpOptions);
        txtModThreshold->setObjectName(QStringLiteral("txtModThreshold"));
        txtModThreshold->setEnabled(false);
        txtModThreshold->setGeometry(QRect(180, 120, 81, 20));
        QSizePolicy sizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(txtModThreshold->sizePolicy().hasHeightForWidth());
        txtModThreshold->setSizePolicy(sizePolicy);
        chkTruncThreshold = new QCheckBox(bgrpOptions);
        chkTruncThreshold->setObjectName(QStringLiteral("chkTruncThreshold"));
        chkTruncThreshold->setGeometry(QRect(10, 254, 111, 20));
        chkVisualDiffResult = new QCheckBox(bgrpOptions);
        chkVisualDiffResult->setObjectName(QStringLiteral("chkVisualDiffResult"));
        chkVisualDiffResult->setGeometry(QRect(10, 147, 191, 17));
        txtTruncThreshold = new QLineEdit(bgrpOptions);
        txtTruncThreshold->setObjectName(QStringLiteral("txtTruncThreshold"));
        txtTruncThreshold->setEnabled(false);
        txtTruncThreshold->setGeometry(QRect(175, 253, 91, 20));
        sizePolicy.setHeightForWidth(txtTruncThreshold->sizePolicy().hasHeightForWidth());
        txtTruncThreshold->setSizePolicy(sizePolicy);
        txtDupThreshold = new QLineEdit(bgrpOptions);
        txtDupThreshold->setObjectName(QStringLiteral("txtDupThreshold"));
        txtDupThreshold->setEnabled(false);
        txtDupThreshold->setGeometry(QRect(175, 228, 91, 21));
        sizePolicy.setHeightForWidth(txtDupThreshold->sizePolicy().hasHeightForWidth());
        txtDupThreshold->setSizePolicy(sizePolicy);
        grpbProcessing = new QGroupBox(bgrpOptions);
        grpbProcessing->setObjectName(QStringLiteral("grpbProcessing"));
        grpbProcessing->setGeometry(QRect(460, 100, 161, 91));
        verticalLayout_4 = new QVBoxLayout(grpbProcessing);
        verticalLayout_4->setObjectName(QStringLiteral("verticalLayout_4"));
        chkProcDuplicates = new QCheckBox(grpbProcessing);
        chkProcDuplicates->setObjectName(QStringLiteral("chkProcDuplicates"));
        chkProcDuplicates->setChecked(true);

        verticalLayout_4->addWidget(chkProcDuplicates);

        chkProcComplexity = new QCheckBox(grpbProcessing);
        chkProcComplexity->setObjectName(QStringLiteral("chkProcComplexity"));
        chkProcComplexity->setChecked(true);

        verticalLayout_4->addWidget(chkProcComplexity);

        chkWarnings = new QCheckBox(grpbProcessing);
        chkWarnings->setObjectName(QStringLiteral("chkWarnings"));

        verticalLayout_4->addWidget(chkWarnings);

        grpbOutputFormat = new QGroupBox(bgrpOptions);
        grpbOutputFormat->setObjectName(QStringLiteral("grpbOutputFormat"));
        grpbOutputFormat->setGeometry(QRect(300, 100, 141, 142));
        verticalLayout_3 = new QVBoxLayout(grpbOutputFormat);
        verticalLayout_3->setObjectName(QStringLiteral("verticalLayout_3"));
        rdoCSVOutput = new QRadioButton(grpbOutputFormat);
        rdoCSVOutput->setObjectName(QStringLiteral("rdoCSVOutput"));
        rdoCSVOutput->setChecked(true);

        verticalLayout_3->addWidget(rdoCSVOutput);

        rdoAsciiOutput = new QRadioButton(grpbOutputFormat);
        rdoAsciiOutput->setObjectName(QStringLiteral("rdoAsciiOutput"));

        verticalLayout_3->addWidget(rdoAsciiOutput);

        rdoLegacyOutput = new QRadioButton(grpbOutputFormat);
        rdoLegacyOutput->setObjectName(QStringLiteral("rdoLegacyOutput"));

        verticalLayout_3->addWidget(rdoLegacyOutput);

        chkUnifiedOut = new QCheckBox(grpbOutputFormat);
        chkUnifiedOut->setObjectName(QStringLiteral("chkUnifiedOut"));

        verticalLayout_3->addWidget(chkUnifiedOut);

        chkCc4Enable = new QCheckBox(grpbOutputFormat);
        chkCc4Enable->setObjectName(QStringLiteral("chkCc4Enable"));

        verticalLayout_3->addWidget(chkCc4Enable);

        chkRamLimit = new QCheckBox(bgrpOptions);
        chkRamLimit->setObjectName(QStringLiteral("chkRamLimit"));
        chkRamLimit->setGeometry(QRect(10, 200, 161, 21));
        txtRamLimit = new QLineEdit(bgrpOptions);
        txtRamLimit->setObjectName(QStringLiteral("txtRamLimit"));
        txtRamLimit->setEnabled(false);
        txtRamLimit->setGeometry(QRect(175, 200, 91, 21));
        sizePolicy.setHeightForWidth(txtRamLimit->sizePolicy().hasHeightForWidth());
        txtRamLimit->setSizePolicy(sizePolicy);
        chkThreads = new QCheckBox(bgrpOptions);
        chkThreads->setObjectName(QStringLiteral("chkThreads"));
        chkThreads->setGeometry(QRect(10, 170, 131, 20));
        txtThreads = new QLineEdit(bgrpOptions);
        txtThreads->setObjectName(QStringLiteral("txtThreads"));
        txtThreads->setGeometry(QRect(180, 170, 81, 20));
        layoutWidget3 = new QWidget(bgrpOptions);
        layoutWidget3->setObjectName(QStringLiteral("layoutWidget3"));
        layoutWidget3->setGeometry(QRect(10, 23, 751, 78));
        gridLayout = new QGridLayout(layoutWidget3);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        gridLayout->setContentsMargins(0, 0, 0, 0);
        lblOutputDir = new QLabel(layoutWidget3);
        lblOutputDir->setObjectName(QStringLiteral("lblOutputDir"));

        gridLayout->addWidget(lblOutputDir, 0, 0, 1, 1);

        txtOutputDir = new QLineEdit(layoutWidget3);
        txtOutputDir->setObjectName(QStringLiteral("txtOutputDir"));

        gridLayout->addWidget(txtOutputDir, 0, 1, 1, 1);

        btnBrowseOutputDir = new QPushButton(layoutWidget3);
        btnBrowseOutputDir->setObjectName(QStringLiteral("btnBrowseOutputDir"));
        btnBrowseOutputDir->setIcon(icon1);
        btnBrowseOutputDir->setIconSize(QSize(22, 22));

        gridLayout->addWidget(btnBrowseOutputDir, 0, 2, 1, 1);

        chkExtensionFile = new QCheckBox(layoutWidget3);
        chkExtensionFile->setObjectName(QStringLiteral("chkExtensionFile"));

        gridLayout->addWidget(chkExtensionFile, 1, 0, 1, 1);

        txtExtensionFile = new QLineEdit(layoutWidget3);
        txtExtensionFile->setObjectName(QStringLiteral("txtExtensionFile"));
        txtExtensionFile->setEnabled(false);

        gridLayout->addWidget(txtExtensionFile, 1, 1, 1, 1);

        btnBrowseExtensionFile = new QPushButton(layoutWidget3);
        btnBrowseExtensionFile->setObjectName(QStringLiteral("btnBrowseExtensionFile"));
        btnBrowseExtensionFile->setEnabled(false);
        btnBrowseExtensionFile->setIcon(icon1);
        btnBrowseExtensionFile->setIconSize(QSize(22, 22));

        gridLayout->addWidget(btnBrowseExtensionFile, 1, 2, 1, 1);

        chkProcLinks = new QCheckBox(bgrpOptions);
        chkProcLinks->setObjectName(QStringLiteral("chkProcLinks"));
        chkProcLinks->setGeometry(QRect(640, 160, 161, 17));
        chkClearCaseFiles = new QCheckBox(bgrpOptions);
        chkClearCaseFiles->setObjectName(QStringLiteral("chkClearCaseFiles"));
        chkClearCaseFiles->setGeometry(QRect(640, 116, 161, 21));
        chkUncounted = new QCheckBox(bgrpOptions);
        chkUncounted->setObjectName(QStringLiteral("chkUncounted"));
        chkUncounted->setGeometry(QRect(640, 140, 161, 17));
        chkDupThreshold->raise();
        chkDifferencing->raise();
        chkModThreshold->raise();
        txtModThreshold->raise();
        chkTruncThreshold->raise();
        chkVisualDiffResult->raise();
        txtTruncThreshold->raise();
        txtDupThreshold->raise();
        grpbProcessing->raise();
        grpbOutputFormat->raise();
        chkRamLimit->raise();
        txtRamLimit->raise();
        chkThreads->raise();
        txtThreads->raise();
        layoutWidget->raise();
        chkProcLinks->raise();
        chkClearCaseFiles->raise();
        chkClearCaseFiles->raise();
        chkUncounted->raise();

        verticalLayout_10->addWidget(bgrpOptions);

        horizontalLayout_4 = new QHBoxLayout();
        horizontalLayout_4->setObjectName(QStringLiteral("horizontalLayout_4"));
        verticalLayout_9 = new QVBoxLayout();
        verticalLayout_9->setObjectName(QStringLiteral("verticalLayout_9"));
        btnStart = new QPushButton(centralwidget);
        btnStart->setObjectName(QStringLiteral("btnStart"));
        QIcon icon8;
        icon8.addFile(QStringLiteral(":/images/start.png"), QSize(), QIcon::Normal, QIcon::Off);
        btnStart->setIcon(icon8);

        verticalLayout_9->addWidget(btnStart);

        btnStop = new QPushButton(centralwidget);
        btnStop->setObjectName(QStringLiteral("btnStop"));
        btnStop->setEnabled(false);
        QIcon icon9;
        icon9.addFile(QStringLiteral(":/images/stop.png"), QSize(), QIcon::Normal, QIcon::Off);
        btnStop->setIcon(icon9);

        verticalLayout_9->addWidget(btnStop);


        horizontalLayout_4->addLayout(verticalLayout_9);

        txtMessages = new QTextEdit(centralwidget);
        txtMessages->setObjectName(QStringLiteral("txtMessages"));
        txtMessages->setEnabled(false);
        QSizePolicy sizePolicy1(QSizePolicy::Expanding, QSizePolicy::Fixed);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(txtMessages->sizePolicy().hasHeightForWidth());
        txtMessages->setSizePolicy(sizePolicy1);
        txtMessages->setMaximumSize(QSize(16777215, 80));
        QFont font;
        font.setFamily(QStringLiteral("Consolas"));
        txtMessages->setFont(font);
        txtMessages->setReadOnly(true);

        horizontalLayout_4->addWidget(txtMessages);


        verticalLayout_10->addLayout(horizontalLayout_4);

        GMainWindowClass->setCentralWidget(centralwidget);
        menubar = new QMenuBar(GMainWindowClass);
        menubar->setObjectName(QStringLiteral("menubar"));
        menubar->setGeometry(QRect(0, 0, 1148, 21));
        menubar->setProperty("windowicon", QVariant(icon));
        menuAbout = new QMenu(menubar);
        menuAbout->setObjectName(QStringLiteral("menuAbout"));
        menuHelp = new QMenu(menubar);
        menuHelp->setObjectName(QStringLiteral("menuHelp"));
        GMainWindowClass->setMenuBar(menubar);
        statusBar = new QStatusBar(GMainWindowClass);
        statusBar->setObjectName(QStringLiteral("statusBar"));
        GMainWindowClass->setStatusBar(statusBar);
        QWidget::setTabOrder(lwFileListA, btnAddFileA);
        QWidget::setTabOrder(btnAddFileA, btnRemoveFileA);
        QWidget::setTabOrder(btnRemoveFileA, btnAddFolderA);
        QWidget::setTabOrder(btnAddFolderA, lwFileListB);
        QWidget::setTabOrder(lwFileListB, btnAddFileB);
        QWidget::setTabOrder(btnAddFileB, btnRemoveFileB);
        QWidget::setTabOrder(btnRemoveFileB, btnAddFolderB);
        QWidget::setTabOrder(btnAddFolderB, lwExtensionList);
        QWidget::setTabOrder(lwExtensionList, btnClearSelExt);
        QWidget::setTabOrder(btnClearSelExt, txtOutputDir);
        QWidget::setTabOrder(txtOutputDir, btnBrowseOutputDir);
        QWidget::setTabOrder(btnBrowseOutputDir, chkExtensionFile);
        QWidget::setTabOrder(chkExtensionFile, txtExtensionFile);
        QWidget::setTabOrder(txtExtensionFile, btnBrowseExtensionFile);
        QWidget::setTabOrder(btnBrowseExtensionFile, chkDifferencing);
        QWidget::setTabOrder(chkDifferencing, chkModThreshold);
        QWidget::setTabOrder(chkModThreshold, txtModThreshold);
        QWidget::setTabOrder(txtModThreshold, chkTruncThreshold);
        QWidget::setTabOrder(chkTruncThreshold, txtTruncThreshold);
        QWidget::setTabOrder(txtTruncThreshold, rdoCSVOutput);
        QWidget::setTabOrder(rdoCSVOutput, rdoAsciiOutput);
        QWidget::setTabOrder(rdoAsciiOutput, rdoLegacyOutput);
        QWidget::setTabOrder(rdoLegacyOutput, chkUnifiedOut);
        QWidget::setTabOrder(chkUnifiedOut, btnStart);
        QWidget::setTabOrder(btnStart, btnStop);
        QWidget::setTabOrder(btnStop, txtMessages);

        menubar->addAction(menuAbout->menuAction());
        menubar->addAction(menuHelp->menuAction());
        menuAbout->addAction(actionOpen_File);
        menuAbout->addSeparator();
        menuAbout->addAction(actionEdit_Extensions);
        menuAbout->addSeparator();
        menuAbout->addAction(actionExit);
        menuHelp->addAction(actionUser_Manual);
        menuHelp->addAction(actionRelease_Notes);
        menuHelp->addAction(actionLicense);
        menuHelp->addAction(actionAbout);

        retranslateUi(GMainWindowClass);

        QMetaObject::connectSlotsByName(GMainWindowClass);
    } // setupUi

    void retranslateUi(QMainWindow *GMainWindowClass)
    {
        GMainWindowClass->setWindowTitle(QApplication::translate("GMainWindowClass", "Unified Code Counter (UCC)", 0));
        actionOpen_File->setText(QApplication::translate("GMainWindowClass", "Open File", 0));
#ifndef QT_NO_TOOLTIP
        actionOpen_File->setToolTip(QApplication::translate("GMainWindowClass", "Open File", 0));
#endif // QT_NO_TOOLTIP
        actionExit->setText(QApplication::translate("GMainWindowClass", "Exit", 0));
        actionUser_Manual->setText(QApplication::translate("GMainWindowClass", "User Manual", 0));
        actionAbout->setText(QApplication::translate("GMainWindowClass", "About", 0));
        actionEdit_Extensions->setText(QApplication::translate("GMainWindowClass", "View/Edit Extensions", 0));
#ifndef QT_NO_TOOLTIP
        actionEdit_Extensions->setToolTip(QApplication::translate("GMainWindowClass", "View/Edit Extensions", 0));
#endif // QT_NO_TOOLTIP
        actionRelease_Notes->setText(QApplication::translate("GMainWindowClass", "Release Notes", 0));
#ifndef QT_NO_TOOLTIP
        actionRelease_Notes->setToolTip(QApplication::translate("GMainWindowClass", "Release Notes", 0));
#endif // QT_NO_TOOLTIP
        actionLicense->setText(QApplication::translate("GMainWindowClass", "License", 0));
        lblFilesA->setText(QApplication::translate("GMainWindowClass", "Files/Folders To Count:", 0));
#ifndef QT_NO_TOOLTIP
        btnAddFileA->setToolTip(QApplication::translate("GMainWindowClass", "Add File", 0));
#endif // QT_NO_TOOLTIP
        btnAddFileA->setText(QString());
        lblAddFileA->setText(QApplication::translate("GMainWindowClass", "Add File", 0));
#ifndef QT_NO_TOOLTIP
        btnRemoveFileA->setToolTip(QApplication::translate("GMainWindowClass", "Remove File", 0));
#endif // QT_NO_TOOLTIP
        btnRemoveFileA->setText(QString());
        lblRemoveFileA->setText(QApplication::translate("GMainWindowClass", "Remove File", 0));
#ifndef QT_NO_TOOLTIP
        btnAddFolderA->setToolTip(QApplication::translate("GMainWindowClass", "Add Folder", 0));
#endif // QT_NO_TOOLTIP
        btnAddFolderA->setText(QString());
        lblAddFolderA->setText(QApplication::translate("GMainWindowClass", "Add Folder", 0));
        lblFilesB->setText(QApplication::translate("GMainWindowClass", "File Set B to Differentiate:", 0));
#ifndef QT_NO_TOOLTIP
        btnAddFileB->setToolTip(QApplication::translate("GMainWindowClass", "Add File", 0));
#endif // QT_NO_TOOLTIP
        btnAddFileB->setText(QString());
        lblAddFileB->setText(QApplication::translate("GMainWindowClass", "Add File", 0));
#ifndef QT_NO_TOOLTIP
        btnRemoveFileB->setToolTip(QApplication::translate("GMainWindowClass", "Remove File", 0));
#endif // QT_NO_TOOLTIP
        btnRemoveFileB->setText(QString());
        lblRemoveFileB->setText(QApplication::translate("GMainWindowClass", "Remove File", 0));
#ifndef QT_NO_TOOLTIP
        btnAddFolderB->setToolTip(QApplication::translate("GMainWindowClass", "Add Folder", 0));
#endif // QT_NO_TOOLTIP
        btnAddFolderB->setText(QString());
        lblAddFolderB->setText(QApplication::translate("GMainWindowClass", "Add Folder", 0));
        lblExtensionList->setText(QApplication::translate("GMainWindowClass", "Filter Extensions:", 0));
#ifndef QT_NO_TOOLTIP
        btnClearSelExt->setToolTip(QApplication::translate("GMainWindowClass", "Clear Extension Selection", 0));
#endif // QT_NO_TOOLTIP
        btnClearSelExt->setText(QString());
        lblClearSelExt->setText(QApplication::translate("GMainWindowClass", "Clear Selection", 0));
        bgrpOptions->setTitle(QApplication::translate("GMainWindowClass", "Program Options", 0));
#ifndef QT_NO_TOOLTIP
        chkDupThreshold->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Duplicate Threshold (</span><span style=\" font-weight:600; font-style:italic;\">-tdup &lt;#&gt;</span><span style=\" font-weight:600;\">)</span></p><p>Specifies the percentage of logical source lines of code (LSLOC) that have changed between two files of the same name in order to determine whether the files are duplicates. If the percentage of common LSLOC between two files is less than or equal to the specified threshold, the files are considered duplicates. This method compares LSLOC similar to the differencing function and ignores formatting including blank lines and comments. Note that files of different names may be checked for an exact physical match. The valid range is 0 to 100 and defaults to 0.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkDupThreshold->setText(QApplication::translate("GMainWindowClass", "Duplicate Threshold", 0));
#ifndef QT_NO_TOOLTIP
        chkDifferencing->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Differencing (</span><span style=\" font-weight:600; font-style:italic;\">-d</span><span style=\" font-weight:600;\">)</span></p><p>Enables the differencing function. If not specified, only the counting functions will execute.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkDifferencing->setText(QApplication::translate("GMainWindowClass", "Differencing", 0));
#ifndef QT_NO_TOOLTIP
        chkModThreshold->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Modified Threshold (</span><span style=\" font-weight:600; font-style:italic;\">-t &lt;#&gt;</span><span style=\" font-weight:600;\">)</span></p><p>Specifies the percentage of common characters between two lines of code that are being compared in order to determine whether the line is modified or replaced. If the percentage of common characters between the compared lines is greater than the specified threshold, the line is considered replaced and will be counted as one line deleted and one line added. Otherwise, it will be counted as one modified line. The valid range is 0 to 100 and defaults to 60.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkModThreshold->setText(QApplication::translate("GMainWindowClass", "Modified Threshold", 0));
        txtModThreshold->setText(QApplication::translate("GMainWindowClass", "60", 0));
#ifndef QT_NO_TOOLTIP
        chkTruncThreshold->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Line Truncate (</span><span style=\" font-weight:600; font-style:italic;\">-trunc &lt;#&gt;</span><span style=\" font-weight:600;\">)</span></p><p>Specifies the maximum number of characters allowed in a logical source line of code (LSLOC). Any characters beyond the specified threshold will be truncated and ignored when compared. If the truncation is disabled by setting the threshold to 0 or the threshold is set too high, very long LSLOC may significantly degrade performance.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkTruncThreshold->setText(QApplication::translate("GMainWindowClass", "Line Truncate", 0));
        chkVisualDiffResult->setText(QApplication::translate("GMainWindowClass", "Visual Differencing Result", 0));
        txtTruncThreshold->setText(QApplication::translate("GMainWindowClass", "10000", 0));
        txtDupThreshold->setText(QApplication::translate("GMainWindowClass", "0", 0));
        grpbProcessing->setTitle(QApplication::translate("GMainWindowClass", "                                Processing", 0));
#ifndef QT_NO_TOOLTIP
        chkProcDuplicates->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Process Duplicates (</span><span style=\" font-weight:600; font-style:italic;\">inverse -nodup</span><span style=\" font-weight:600;\">)</span></p><p>Enables separate processing of duplicate files. Disabling this avoids extra processing time to determine the presence of duplicate files within each baseline. When disabled, all files will be counted and reported together, regardless of whether they are duplicates. Otherwise, file within a baseline will be checked for duplicates and results will be reported separately. Please see the user manual for details.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkProcDuplicates->setText(QApplication::translate("GMainWindowClass", "Process Duplicates?", 0));
#ifndef QT_NO_TOOLTIP
        chkProcComplexity->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Process Complexity (</span><span style=\" font-weight:600; font-style:italic;\">inverse -nocomplex</span><span style=\" font-weight:600;\">)</span></p><p>Enables printing of keyword counts and processing of complexity metrics. Disabling this can reduce processing time and limit reports.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkProcComplexity->setText(QApplication::translate("GMainWindowClass", "Process Complexity?", 0));
#ifndef QT_NO_TOOLTIP
        chkWarnings->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-family:'Calibri';\">If this is set then no warning messages will show on the user interface.\302\240 Warning messages will still be in the log files.</span></p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkWarnings->setText(QApplication::translate("GMainWindowClass", "No Warnings", 0));
        grpbOutputFormat->setTitle(QApplication::translate("GMainWindowClass", "Output Format", 0));
#ifndef QT_NO_TOOLTIP
        rdoCSVOutput->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Comma Separated (</span><span style=\" font-weight:600; font-style:italic;\">default</span><span style=\" font-weight:600;\">)</span></p><p>Prints CSV (*.csv) report files instead of ASCII text (*.txt) files. The content of the CSV format is identical to the ASCII format.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        rdoCSVOutput->setText(QApplication::translate("GMainWindowClass", "Comma Separated", 0));
#ifndef QT_NO_TOOLTIP
        rdoAsciiOutput->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Plain Text (</span><span style=\" font-weight:600; font-style:italic;\">-ascii</span><span style=\" font-weight:600;\">)</span></p><p>Prints ASCII text (*.txt) report files instead of CSV (*.csv) files. The content of the ASCII format is identical to the CSV format.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        rdoAsciiOutput->setText(QApplication::translate("GMainWindowClass", "Plain Text", 0));
#ifndef QT_NO_TOOLTIP
        rdoLegacyOutput->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Legacy Text (</span><span style=\" font-weight:600; font-style:italic;\">-legacy</span><span style=\" font-weight:600;\">)</span></p><p>Prints legacy formatted ASCII text report files instead of the current format of the CSV or ASCII text files. The purpose of this option is to maintain backward compatibility with some older UCC results post-processing software systems. This options is rarely required.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        rdoLegacyOutput->setText(QApplication::translate("GMainWindowClass", "Legacy Text", 0));
#ifndef QT_NO_TOOLTIP
        chkUnifiedOut->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Unified Output (</span><span style=\" font-weight:600; font-style:italic;\">-unified</span><span style=\" font-weight:600;\">)</span></p><p>Prints language report files to a single unified report file. The results are written to 'TOTAL_outfile.csv' or 'TOTAL_outfile.txt'. In the absence of this option, results for each language are written to separate files.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkUnifiedOut->setText(QApplication::translate("GMainWindowClass", "Unified Output", 0));
        chkCc4Enable->setText(QApplication::translate("GMainWindowClass", "CC4 Enable", 0));
#ifndef QT_NO_TOOLTIP
        chkRamLimit->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-family:'Calibri';\">Tell UCC what is a reasonable RAM limit to use to decide if a warning is needed about estimated minimum RAM use.\302\240 # may be 1 (default is 5 if not specified) up to 5120.\302\240 Each number above zero represents an increment of 100 Mbytes.\302\240 So 10 is approximately 1 Gbyte and 5120 is exactly 500 Gbytes.</span></p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkRamLimit->setText(QApplication::translate("GMainWindowClass", "Ram Limit:  1 to 5120", 0));
        txtRamLimit->setInputMask(QString());
        txtRamLimit->setText(QApplication::translate("GMainWindowClass", "20", 0));
#ifndef QT_NO_TOOLTIP
        chkThreads->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-family:'Calibri';\">Tell UCC to use extra worker Threads for faster processing.  You should probably not use more than 3 times the number of CPU cores available.</span></p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkThreads->setText(QApplication::translate("GMainWindowClass", "Threads:  2 to 80", 0));
#ifndef QT_NO_TOOLTIP
        txtThreads->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p>Tell UCC that you want to use extra worker threads for faster processing.  No extra worker threads will be used if this is not checked.  You probably should not use more than 3 times the actual number of CPU cores.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        txtThreads->setText(QApplication::translate("GMainWindowClass", "2", 0));
#ifndef QT_NO_TOOLTIP
        lblOutputDir->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Working Directory</span></p><p>Specifies the directory where any intermediate files will be written. The output files will be written to the working directory by default unless an Output Directory is specified.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        lblOutputDir->setText(QApplication::translate("GMainWindowClass", "Output Directory", 0));
#ifndef QT_NO_TOOLTIP
        btnBrowseOutputDir->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p>Browse the file system for the Working Directory.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        btnBrowseOutputDir->setText(QString());
#ifndef QT_NO_TOOLTIP
        chkExtensionFile->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Extension File (</span><span style=\" font-weight:600; font-style:italic;\">-extfile &lt;filePath&gt;</span><span style=\" font-weight:600;\">)</span></p><p>Specifies a file containing user specified file extensions for any of the available language counters. Any language counter specified within this file will have its associated extensions replaced. If a language is specified with no extensions, the language counter will be disabled. The file format contains a single line entry for each language. Single or multi-line comments may be included with square brackets []. For example:</p><p>C_CPP = *.cpp, *.h [C/C++ extensions]</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkExtensionFile->setText(QApplication::translate("GMainWindowClass", "Extension File", 0));
#ifndef QT_NO_TOOLTIP
        btnBrowseExtensionFile->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p>Browse the file system for the Extension File.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        btnBrowseExtensionFile->setText(QString());
#ifndef QT_NO_TOOLTIP
        chkProcLinks->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Follow Links (</span><span style=\" font-weight:600; font-style:italic;\">inverse -nolinks</span><span style=\" font-weight:600;\">)</span></p><p>Enables following symbolic links to directories and counting of links to files on Unix systems. Disabling this can prevent duplicate file counts.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkProcLinks->setText(QApplication::translate("GMainWindowClass", "Follow Links?", 0));
#ifndef QT_NO_TOOLTIP
        chkClearCaseFiles->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-weight:600;\">Clear Case Files (</span><span style=\" font-weight:600; font-style:italic;\">-cf</span><span style=\" font-weight:600;\">)</span></p><p>Indicates that the target files were retrieved from IBM Rational ClearCase. ClearCase appends information at the end of file names beginning with '@@'. Use of this option strips all characters after the last '@@' sequence from the file name.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkClearCaseFiles->setText(QApplication::translate("GMainWindowClass", "Clear Case Files", 0));
#ifndef QT_NO_TOOLTIP
        chkUncounted->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p><span style=\" font-family:'Calibri';\">If this is set then there will be no Uncounted file message for either the user interface or the log files.\302\240 Not recommended except for experienced users.</span></p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        chkUncounted->setText(QApplication::translate("GMainWindowClass", "No Uncounted File Message", 0));
#ifndef QT_NO_TOOLTIP
        btnStart->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p>Starts the execution of counting and/or comparison based on the current selections.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        btnStart->setText(QApplication::translate("GMainWindowClass", "Start", 0));
#ifndef QT_NO_TOOLTIP
        btnStop->setToolTip(QApplication::translate("GMainWindowClass", "<html><head/><body><p>Stops the currently running counting operation.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        btnStop->setText(QApplication::translate("GMainWindowClass", "Stop", 0));
        menuAbout->setTitle(QApplication::translate("GMainWindowClass", "File", 0));
        menuHelp->setTitle(QApplication::translate("GMainWindowClass", "Help", 0));
    } // retranslateUi

};

namespace Ui {
    class GMainWindowClass: public Ui_GMainWindowClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_GMAINWINDOW_H
