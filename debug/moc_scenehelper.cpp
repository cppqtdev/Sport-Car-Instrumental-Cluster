/****************************************************************************
** Meta object code from reading C++ file 'scenehelper.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.15)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../scenehelper.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'scenehelper.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.15. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_SceneHelper_t {
    QByteArrayData data[17];
    char stringdata0[206];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SceneHelper_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SceneHelper_t qt_meta_stringdata_SceneHelper = {
    {
QT_MOC_LITERAL(0, 0, 11), // "SceneHelper"
QT_MOC_LITERAL(1, 12, 10), // "findEntity"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 25), // "Qt3DRender::QSceneLoader*"
QT_MOC_LITERAL(4, 50, 6), // "loader"
QT_MOC_LITERAL(5, 57, 4), // "name"
QT_MOC_LITERAL(6, 62, 12), // "addListEntry"
QT_MOC_LITERAL(7, 75, 4), // "list"
QT_MOC_LITERAL(8, 80, 5), // "entry"
QT_MOC_LITERAL(9, 86, 15), // "removeFromScene"
QT_MOC_LITERAL(10, 102, 5), // "names"
QT_MOC_LITERAL(11, 108, 17), // "addBasicMaterials"
QT_MOC_LITERAL(12, 126, 22), // "Qt3DRender::QMaterial*"
QT_MOC_LITERAL(13, 149, 8), // "material"
QT_MOC_LITERAL(14, 158, 18), // "addTextureMaterial"
QT_MOC_LITERAL(15, 177, 15), // "replaceMaterial"
QT_MOC_LITERAL(16, 193, 12) // "searchCamera"

    },
    "SceneHelper\0findEntity\0\0"
    "Qt3DRender::QSceneLoader*\0loader\0name\0"
    "addListEntry\0list\0entry\0removeFromScene\0"
    "names\0addBasicMaterials\0Qt3DRender::QMaterial*\0"
    "material\0addTextureMaterial\0replaceMaterial\0"
    "searchCamera"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SceneHelper[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   49,    2, 0x02 /* Public */,
       6,    2,   54,    2, 0x02 /* Public */,
       9,    2,   59,    2, 0x02 /* Public */,
      11,    3,   64,    2, 0x02 /* Public */,
      14,    3,   71,    2, 0x02 /* Public */,
      15,    3,   78,    2, 0x02 /* Public */,
      16,    2,   85,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QObjectStar, 0x80000000 | 3, QMetaType::QString,    4,    5,
    QMetaType::Void, QMetaType::QVariant, QMetaType::QObjectStar,    7,    8,
    QMetaType::Void, 0x80000000 | 3, QMetaType::QStringList,    4,   10,
    QMetaType::Void, 0x80000000 | 3, 0x80000000 | 12, QMetaType::QStringList,    4,   13,   10,
    QMetaType::Void, 0x80000000 | 3, 0x80000000 | 12, QMetaType::QString,    4,   13,    5,
    QMetaType::Void, 0x80000000 | 3, QMetaType::QString, 0x80000000 | 12,    4,    5,   13,
    QMetaType::Void, 0x80000000 | 3, QMetaType::QString,    4,    5,

       0        // eod
};

void SceneHelper::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SceneHelper *>(_o);
        (void)_t;
        switch (_id) {
        case 0: { QObject* _r = _t->findEntity((*reinterpret_cast< Qt3DRender::QSceneLoader*(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QObject**>(_a[0]) = std::move(_r); }  break;
        case 1: _t->addListEntry((*reinterpret_cast< const QVariant(*)>(_a[1])),(*reinterpret_cast< QObject*(*)>(_a[2]))); break;
        case 2: _t->removeFromScene((*reinterpret_cast< Qt3DRender::QSceneLoader*(*)>(_a[1])),(*reinterpret_cast< const QStringList(*)>(_a[2]))); break;
        case 3: _t->addBasicMaterials((*reinterpret_cast< Qt3DRender::QSceneLoader*(*)>(_a[1])),(*reinterpret_cast< Qt3DRender::QMaterial*(*)>(_a[2])),(*reinterpret_cast< QStringList(*)>(_a[3]))); break;
        case 4: _t->addTextureMaterial((*reinterpret_cast< Qt3DRender::QSceneLoader*(*)>(_a[1])),(*reinterpret_cast< Qt3DRender::QMaterial*(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 5: _t->replaceMaterial((*reinterpret_cast< Qt3DRender::QSceneLoader*(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< Qt3DRender::QMaterial*(*)>(_a[3]))); break;
        case 6: _t->searchCamera((*reinterpret_cast< Qt3DRender::QSceneLoader*(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Qt3DRender::QSceneLoader* >(); break;
            }
            break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Qt3DRender::QSceneLoader* >(); break;
            }
            break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 1:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Qt3DRender::QMaterial* >(); break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Qt3DRender::QSceneLoader* >(); break;
            }
            break;
        case 4:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 1:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Qt3DRender::QMaterial* >(); break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Qt3DRender::QSceneLoader* >(); break;
            }
            break;
        case 5:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 2:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Qt3DRender::QMaterial* >(); break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Qt3DRender::QSceneLoader* >(); break;
            }
            break;
        case 6:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Qt3DRender::QSceneLoader* >(); break;
            }
            break;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject SceneHelper::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_SceneHelper.data,
    qt_meta_data_SceneHelper,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *SceneHelper::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SceneHelper::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_SceneHelper.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int SceneHelper::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
