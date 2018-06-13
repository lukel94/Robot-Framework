/********************************************************************************
** Form generated from reading UI file 'GSideBySideDialog.ui'
**
** Created by: Qt User Interface Compiler version 5.4.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_GSIDEBYSIDEDIALOG_H
#define UI_GSIDEBYSIDEDIALOG_H

#include <QtCore/QVariant>
#include <QtWebKitWidgets/QWebView>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_GSideBySideDialog
{
public:
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *horizontalLayout;
    QLineEdit *lineEdit;
    QLineEdit *lineEdit_2;
    QWebView *webView;
    QHBoxLayout *horizontalLayout_2;
    QSpacerItem *horizontalSpacer;
    QPushButton *btnClose;
    QSpacerItem *horizontalSpacer_2;

    void setupUi(QDialog *GSideBySideDialog)
    {
        if (GSideBySideDialog->objectName().isEmpty())
            GSideBySideDialog->setObjectName(QStringLiteral("GSideBySideDialog"));
        GSideBySideDialog->resize(811, 499);
        verticalLayoutWidget = new QWidget(GSideBySideDialog);
        verticalLayoutWidget->setObjectName(QStringLiteral("verticalLayoutWidget"));
        verticalLayoutWidget->setGeometry(QRect(10, 10, 791, 471));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        lineEdit = new QLineEdit(verticalLayoutWidget);
        lineEdit->setObjectName(QStringLiteral("lineEdit"));

        horizontalLayout->addWidget(lineEdit);

        lineEdit_2 = new QLineEdit(verticalLayoutWidget);
        lineEdit_2->setObjectName(QStringLiteral("lineEdit_2"));

        horizontalLayout->addWidget(lineEdit_2);


        verticalLayout->addLayout(horizontalLayout);

        webView = new QWebView(verticalLayoutWidget);
        webView->setObjectName(QStringLiteral("webView"));
        webView->setUrl(QUrl(QStringLiteral("about:blank")));

        verticalLayout->addWidget(webView);

        horizontalLayout_2 = new QHBoxLayout();
        horizontalLayout_2->setObjectName(QStringLiteral("horizontalLayout_2"));
        horizontalSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer);

        btnClose = new QPushButton(verticalLayoutWidget);
        btnClose->setObjectName(QStringLiteral("btnClose"));
        btnClose->setAutoDefault(true);

        horizontalLayout_2->addWidget(btnClose);

        horizontalSpacer_2 = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(horizontalSpacer_2);


        verticalLayout->addLayout(horizontalLayout_2);


        retranslateUi(GSideBySideDialog);
        QObject::connect(btnClose, SIGNAL(clicked()), GSideBySideDialog, SLOT(accept()));

        QMetaObject::connectSlotsByName(GSideBySideDialog);
    } // setupUi

    void retranslateUi(QDialog *GSideBySideDialog)
    {
        GSideBySideDialog->setWindowTitle(QApplication::translate("GSideBySideDialog", "UCC Differencing Side-by-side Results", 0));
        btnClose->setText(QApplication::translate("GSideBySideDialog", "Close", 0));
    } // retranslateUi

};

namespace Ui {
    class GSideBySideDialog: public Ui_GSideBySideDialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_GSIDEBYSIDEDIALOG_H
