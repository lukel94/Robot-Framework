/********************************************************************************
** Form generated from reading UI file 'GExtensionDialog.ui'
**
** Created by: Qt User Interface Compiler version 5.4.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_GEXTENSIONDIALOG_H
#define UI_GEXTENSIONDIALOG_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QListWidget>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QSplitter>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_GExtensionDialogClass
{
public:
    QVBoxLayout *verticalLayout_3;
    QSplitter *splitter;
    QWidget *layoutWidget;
    QVBoxLayout *verticalLayout;
    QLabel *lblLanguages;
    QListWidget *lwLanguages;
    QWidget *layoutWidget1;
    QVBoxLayout *verticalLayout_2;
    QLabel *lblExtensions;
    QTableWidget *tblExtensions;
    QHBoxLayout *horizontalLayout;
    QSpacerItem *horizontalSpacer;
    QPushButton *btnAddExt;
    QPushButton *btnRemoveExt;
    QPushButton *btnClose;
    QSpacerItem *horizontalSpacer_2;

    void setupUi(QDialog *GExtensionDialogClass)
    {
        if (GExtensionDialogClass->objectName().isEmpty())
            GExtensionDialogClass->setObjectName(QStringLiteral("GExtensionDialogClass"));
        GExtensionDialogClass->resize(500, 400);
        QIcon icon;
        icon.addFile(QStringLiteral(":/images/gucc.png"), QSize(), QIcon::Normal, QIcon::Off);
        GExtensionDialogClass->setWindowIcon(icon);
        GExtensionDialogClass->setSizeGripEnabled(true);
        GExtensionDialogClass->setModal(true);
        verticalLayout_3 = new QVBoxLayout(GExtensionDialogClass);
        verticalLayout_3->setObjectName(QStringLiteral("verticalLayout_3"));
        splitter = new QSplitter(GExtensionDialogClass);
        splitter->setObjectName(QStringLiteral("splitter"));
        QSizePolicy sizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(splitter->sizePolicy().hasHeightForWidth());
        splitter->setSizePolicy(sizePolicy);
        splitter->setOrientation(Qt::Horizontal);
        layoutWidget = new QWidget(splitter);
        layoutWidget->setObjectName(QStringLiteral("layoutWidget"));
        verticalLayout = new QVBoxLayout(layoutWidget);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        lblLanguages = new QLabel(layoutWidget);
        lblLanguages->setObjectName(QStringLiteral("lblLanguages"));

        verticalLayout->addWidget(lblLanguages);

        lwLanguages = new QListWidget(layoutWidget);
        lwLanguages->setObjectName(QStringLiteral("lwLanguages"));

        verticalLayout->addWidget(lwLanguages);

        splitter->addWidget(layoutWidget);
        layoutWidget1 = new QWidget(splitter);
        layoutWidget1->setObjectName(QStringLiteral("layoutWidget1"));
        verticalLayout_2 = new QVBoxLayout(layoutWidget1);
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        verticalLayout_2->setContentsMargins(0, 0, 0, 0);
        lblExtensions = new QLabel(layoutWidget1);
        lblExtensions->setObjectName(QStringLiteral("lblExtensions"));

        verticalLayout_2->addWidget(lblExtensions);

        tblExtensions = new QTableWidget(layoutWidget1);
        if (tblExtensions->columnCount() < 1)
            tblExtensions->setColumnCount(1);
        QTableWidgetItem *__qtablewidgetitem = new QTableWidgetItem();
        tblExtensions->setHorizontalHeaderItem(0, __qtablewidgetitem);
        tblExtensions->setObjectName(QStringLiteral("tblExtensions"));
        tblExtensions->setContextMenuPolicy(Qt::CustomContextMenu);
        tblExtensions->setAlternatingRowColors(true);
        tblExtensions->setColumnCount(1);
        tblExtensions->horizontalHeader()->setVisible(false);
        tblExtensions->verticalHeader()->setVisible(false);

        verticalLayout_2->addWidget(tblExtensions);

        splitter->addWidget(layoutWidget1);

        verticalLayout_3->addWidget(splitter);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        btnAddExt = new QPushButton(GExtensionDialogClass);
        btnAddExt->setObjectName(QStringLiteral("btnAddExt"));
        QIcon icon1;
        icon1.addFile(QStringLiteral(":/images/plus_sign.png"), QSize(), QIcon::Normal, QIcon::Off);
        btnAddExt->setIcon(icon1);
        btnAddExt->setIconSize(QSize(22, 22));

        horizontalLayout->addWidget(btnAddExt);

        btnRemoveExt = new QPushButton(GExtensionDialogClass);
        btnRemoveExt->setObjectName(QStringLiteral("btnRemoveExt"));
        btnRemoveExt->setEnabled(true);
        QIcon icon2;
        icon2.addFile(QStringLiteral(":/images/minus_sign.png"), QSize(), QIcon::Normal, QIcon::Off);
        btnRemoveExt->setIcon(icon2);
        btnRemoveExt->setIconSize(QSize(22, 22));

        horizontalLayout->addWidget(btnRemoveExt);

        btnClose = new QPushButton(GExtensionDialogClass);
        btnClose->setObjectName(QStringLiteral("btnClose"));
        btnClose->setEnabled(true);
        QIcon icon3;
        icon3.addFile(QStringLiteral(":/images/close.png"), QSize(), QIcon::Normal, QIcon::Off);
        btnClose->setIcon(icon3);
        btnClose->setIconSize(QSize(22, 22));

        horizontalLayout->addWidget(btnClose);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_2);


        verticalLayout_3->addLayout(horizontalLayout);


        retranslateUi(GExtensionDialogClass);

        QMetaObject::connectSlotsByName(GExtensionDialogClass);
    } // setupUi

    void retranslateUi(QDialog *GExtensionDialogClass)
    {
        GExtensionDialogClass->setWindowTitle(QApplication::translate("GExtensionDialogClass", "Language File Extensions", 0));
        lblLanguages->setText(QApplication::translate("GExtensionDialogClass", "Languages:", 0));
        lblExtensions->setText(QApplication::translate("GExtensionDialogClass", "Extensions:", 0));
        QTableWidgetItem *___qtablewidgetitem = tblExtensions->horizontalHeaderItem(0);
        ___qtablewidgetitem->setText(QApplication::translate("GExtensionDialogClass", "Extensions", 0));
#ifndef QT_NO_TOOLTIP
        btnAddExt->setToolTip(QApplication::translate("GExtensionDialogClass", "<html><head/><body><p>Add language extension.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        btnAddExt->setText(QString());
#ifndef QT_NO_TOOLTIP
        btnRemoveExt->setToolTip(QApplication::translate("GExtensionDialogClass", "<html><head/><body><p>Remove language extension(s).</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        btnRemoveExt->setText(QString());
#ifndef QT_NO_TOOLTIP
        btnClose->setToolTip(QApplication::translate("GExtensionDialogClass", "<html><head/><body><p>Close dialog.</p></body></html>", 0));
#endif // QT_NO_TOOLTIP
        btnClose->setText(QString());
    } // retranslateUi

};

namespace Ui {
    class GExtensionDialogClass: public Ui_GExtensionDialogClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_GEXTENSIONDIALOG_H
