/****************************************************************************
** Meta object code from reading C++ file 'GExtensionDialog.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.4.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../gui/GExtensionDialog.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'GExtensionDialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.4.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_GExtensionDialog_t {
    QByteArrayData data[15];
    char stringdata[234];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GExtensionDialog_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GExtensionDialog_t qt_meta_stringdata_GExtensionDialog = {
    {
QT_MOC_LITERAL(0, 0, 16), // "GExtensionDialog"
QT_MOC_LITERAL(1, 17, 16), // "updateExtensions"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 16), // "languageSelected"
QT_MOC_LITERAL(4, 52, 16), // "QListWidgetItem*"
QT_MOC_LITERAL(5, 69, 6), // "lwItem"
QT_MOC_LITERAL(6, 76, 30), // "itemCustomContextMenuRequested"
QT_MOC_LITERAL(7, 107, 3), // "pos"
QT_MOC_LITERAL(8, 111, 16), // "revertSelLangExt"
QT_MOC_LITERAL(9, 128, 16), // "revertAllLangExt"
QT_MOC_LITERAL(10, 145, 20), // "on_btnAddExt_clicked"
QT_MOC_LITERAL(11, 166, 23), // "on_btnRemoveExt_clicked"
QT_MOC_LITERAL(12, 190, 19), // "on_btnClose_clicked"
QT_MOC_LITERAL(13, 210, 10), // "closeEvent"
QT_MOC_LITERAL(14, 221, 12) // "QCloseEvent*"

    },
    "GExtensionDialog\0updateExtensions\0\0"
    "languageSelected\0QListWidgetItem*\0"
    "lwItem\0itemCustomContextMenuRequested\0"
    "pos\0revertSelLangExt\0revertAllLangExt\0"
    "on_btnAddExt_clicked\0on_btnRemoveExt_clicked\0"
    "on_btnClose_clicked\0closeEvent\0"
    "QCloseEvent*"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GExtensionDialog[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       3,    1,   60,    2, 0x08 /* Private */,
       6,    1,   63,    2, 0x08 /* Private */,
       8,    0,   66,    2, 0x08 /* Private */,
       9,    0,   67,    2, 0x08 /* Private */,
      10,    0,   68,    2, 0x08 /* Private */,
      11,    0,   69,    2, 0x08 /* Private */,
      12,    0,   70,    2, 0x08 /* Private */,
      13,    1,   71,    2, 0x08 /* Private */,

 // signals: parameters
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 4,    5,
    QMetaType::Void, QMetaType::QPoint,    7,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 14,    2,

       0        // eod
};

void GExtensionDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        GExtensionDialog *_t = static_cast<GExtensionDialog *>(_o);
        switch (_id) {
        case 0: _t->updateExtensions(); break;
        case 1: _t->languageSelected((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 2: _t->itemCustomContextMenuRequested((*reinterpret_cast< const QPoint(*)>(_a[1]))); break;
        case 3: _t->revertSelLangExt(); break;
        case 4: _t->revertAllLangExt(); break;
        case 5: _t->on_btnAddExt_clicked(); break;
        case 6: _t->on_btnRemoveExt_clicked(); break;
        case 7: _t->on_btnClose_clicked(); break;
        case 8: _t->closeEvent((*reinterpret_cast< QCloseEvent*(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (GExtensionDialog::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&GExtensionDialog::updateExtensions)) {
                *result = 0;
            }
        }
    }
}

const QMetaObject GExtensionDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_GExtensionDialog.data,
      qt_meta_data_GExtensionDialog,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *GExtensionDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GExtensionDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_GExtensionDialog.stringdata))
        return static_cast<void*>(const_cast< GExtensionDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int GExtensionDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void GExtensionDialog::updateExtensions()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
