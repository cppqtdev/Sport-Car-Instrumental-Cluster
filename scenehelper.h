#ifndef SCENEHELPER_H
#define SCENEHELPER_H

#include <QtGlobal>
#include <QResource>

#include <Qt3DRender/QRenderAspect>
#include <Qt3DRender/QSceneLoader>
#include <Qt3DCore/QEntity>
#if (QT_VERSION >= QT_VERSION_CHECK(5, 7, 0))
#include <Qt3DRender/QCameraLens>
#else
#include <Qt3DCore/QCameraLens>
#endif
#include <Qt3DRender/QMaterial>
#include <Qt3DQuick/QQmlAspectEngine>
#include <Qt3DCore/QComponent>
#include <QtQml>

class SceneHelper : public QObject
{
    Q_OBJECT

public:
    Q_INVOKABLE QObject *findEntity(Qt3DRender::QSceneLoader *loader, const QString &name);
    Q_INVOKABLE void addListEntry(const QVariant &list, QObject *entry);
    Q_INVOKABLE void removeFromScene(Qt3DRender::QSceneLoader *loader, const QStringList &names);
    Q_INVOKABLE void addBasicMaterials(Qt3DRender::QSceneLoader *loader,
                                       Qt3DRender::QMaterial *material, QStringList names);
    Q_INVOKABLE void addTextureMaterial(Qt3DRender::QSceneLoader *loader,
                                        Qt3DRender::QMaterial *material, QString name);
    Q_INVOKABLE void replaceMaterial(Qt3DRender::QSceneLoader *loader, const QString &name,
                                     Qt3DRender::QMaterial *material);
    Q_INVOKABLE void searchCamera(Qt3DRender::QSceneLoader *loader, const QString &name);

private:
    void addComponents(QStringList &names, Qt3DCore::QEntity *root,
                       Qt3DRender::QMaterial *material);
    void addComponent(QString &name, Qt3DCore::QEntity *root, Qt3DRender::QMaterial *material);
};

#endif // SCENEHELPER_H
