/********************************************************************************
** Form generated from reading UI file 'GAsciiDialog.ui'
**
** Created by: Qt User Interface Compiler version 5.4.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_GASCIIDIALOG_H
#define UI_GASCIIDIALOG_H

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
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_GAsciiDialogClass
{
public:
    QVBoxLayout *verticalLayout;
    QComboBox *cboResultsSelect;
    QTextEdit *txtResults;
    QHBoxLayout *horizontalLayout;
    QSpacerItem *horizontalSpacer;
    QPushButton *btnClose;
    QSpacerItem *horizontalSpacer_2;

    void setupUi(QDialog *GAsciiDialogClass)
    {
        if (GAsciiDialogClass->objectName().isEmpty())
            GAsciiDialogClass->setObjectName(QStringLiteral("GAsciiDialogClass"));
        GAsciiDialogClass->resize(800, 500);
        QIcon icon;
        icon.addFile(QStringLiteral(":/images/gucc.png"), QSize(), QIcon::Normal, QIcon::Off);
        GAsciiDialogClass->setWindowIcon(icon);
        GAsciiDialogClass->setSizeGripEnabled(true);
        verticalLayout = new QVBoxLayout(GAsciiDialogClass);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        cboResultsSelect = new QComboBox(GAsciiDialogClass);
        cboResultsSelect->setObjectName(QStringLiteral("cboResultsSelect"));

        verticalLayout->addWidget(cboResultsSelect);

        txtResults = new QTextEdit(GAsciiDialogClass);
        txtResults->setObjectName(QStringLiteral("txtResults"));
        txtResults->setLineWrapMode(QTextEdit::NoWrap);
        txtResults->setReadOnly(true);

        verticalLayout->addWidget(txtResults);

        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer);

        btnClose = new QPushButton(GAsciiDialogClass);
        btnClose->setObjectName(QStringLiteral("btnClose"));

        horizontalLayout->addWidget(btnClose);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout->addItem(horizontalSpacer_2);


        verticalLayout->addLayout(horizontalLayout);


        retranslateUi(GAsciiDialogClass);
        QObject::connect(btnClose, SIGNAL(clicked()), GAsciiDialogClass, SLOT(accept()));

        QMetaObject::connectSlotsByName(GAsciiDialogClass);
    } // setupUi

    void retranslateUi(QDialog *GAsciiDialogClass)
    {
        GAsciiDialogClass->setWindowTitle(QApplication::translate("GAsciiDialogClass", "UCC Results", 0));
        btnClose->setText(QApplication::translate("GAsciiDialogClass", "Close", 0));
    } // retranslateUi

};

namespace Ui {
    class GAsciiDialogClass: public Ui_GAsciiDialogClass {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_GASCIIDIALOG_H
