/********************************************************************************
** Form generated from reading UI file 'GTableDialog.ui'
**
** Created by: Qt User Interface Compiler version 5.4.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_GTABLEDIALOG_H
#define UI_GTABLEDIALOG_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QDialog>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_GTableDialogClass
{
public:
    QVBoxLayout *verticalLayout;
    QComboBox *cboResultsSelect;
    QTableWidget *tblResults;
    QHBoxLayout *horizontalLayout;
    QSpacerItem *horizontalSpacer;
    QPushButton *btnClose;
    QSpacerItem *horizontalSpacer_2;

    void setupUi(QDialog *GTableDialogClass)
    {
        if (GTableDialogClass->objectName().isEmpty())
            GTableDialogClass->setObjectName(QStringLiteral("GTableDialogClass"));
        GTableDialogClass->resize(800, 500);
        QIcon icon;
        icon.addFile(QStringLiteral(":/images/gucc.png"), QSize(), QIcon::Normal, QIcon::Off);
        GTableDialogClass->setWindowIcon(icon);
        GTableDialogClass->setSizeGripEnabled(true);
        verticalLayout = new QVBoxLayout(GTableDialogClass);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        cboResultsSelect = new QComboBox(GTableDialogClass);
        cboResultsSelect->setObjectName(QStringLiteral("cboResultsSelect"));

        verticalLayout->addWidget(cboResultsSelect);

        tblResults = new QTableWidget(GTableDialogClass);
        tblResults->setObjectName(QStringLiteral("tblResults"));
        tblResults->setSelectionMode(QAbstractItemView::SingleSelection);

        verticalLayout->addWidget(tblResults);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        btnClose = new QPushButton(GTableDialogClass);
        btnClose->setObjectName(QStringLiteral("btnClose"));

        horizontalLayout->addWidget(btnClose);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_2);


        verticalLayout->addLayout(horizontalLayout);


        retranslateUi(GTableDialogClass);
        QObject::connect(btnClose, SIGNAL(clicked()), GTableDialogClass, SLOT(accept()));

        QMetaObject::connectSlotsByName(GTableDialogClass);
    } // setupUi

    void retranslateUi(QDialog *GTableDialogClass)
    {
        GTableDialogClass->setWindowTitle(QApplication::translate("GTableDialogClass", "UCC Results", 0));
        btnClose->setText(QApplication::translate("GTableDialogClass", "Close", 0));
    } // retranslateUi

};

namespace Ui {
    class GTableDialogClass: public Ui_GTableDialogClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_GTABLEDIALOG_H
