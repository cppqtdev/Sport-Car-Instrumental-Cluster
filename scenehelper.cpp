#include "scenehelper.h"

QObject *SceneHelper::findEntity(Qt3DRender::QSceneLoader *loader, const QString &name)
{
    // The QSceneLoader instance is a component of an entity. The loaded scene
    // tree is added under this entity.
    QVector<Qt3DCore::QEntity *> entities = loader->entities();

    if (entities.isEmpty())
        return 0;

    // Technically there could be multiple entities referencing the scene loader
    // but sharing is discouraged, and in our case there will be one anyhow.
    Qt3DCore::QEntity *root = entities[0];

    // The scene structure and names always depend on the asset.
    return root->findChild<Qt3DCore::QEntity *>(name);
}

void SceneHelper::removeFromScene(Qt3DRender::QSceneLoader *loader, const QStringList &names)
{
    QVector<Qt3DCore::QEntity *> entities = loader->entities();

    if (entities.isEmpty())
        return;

    Qt3DCore::QEntity *root = entities[0];

    foreach (QString name, names) {
        QObject *entity = root->findChild<Qt3DCore::QEntity *>(name);
        entity->setParent(nullptr);
    }
}

void SceneHelper::addBasicMaterials(Qt3DRender::QSceneLoader *loader,
                                    Qt3DRender::QMaterial *material, QStringList names)
{
    QVector<Qt3DCore::QEntity *> entities = loader->entities();

    if (entities.isEmpty())
        return;

    Qt3DCore::QEntity *root = entities[0];

    addComponents(names, root, material);
}

void SceneHelper::addTextureMaterial(Qt3DRender::QSceneLoader *loader,
                                     Qt3DRender::QMaterial *material, QString name)
{
    QVector<Qt3DCore::QEntity *> entities = loader->entities();

    if (entities.isEmpty())
        return;

    Qt3DCore::QEntity *root = entities[0];

    addComponent(name, root, material);
}

void SceneHelper::replaceMaterial(Qt3DRender::QSceneLoader *loader, const QString &name,
                                  Qt3DRender::QMaterial *material)
{
    QVector<Qt3DCore::QEntity *> entities = loader->entities();

    if (entities.isEmpty())
        return;

    Qt3DCore::QEntity *root = entities[0];
    Qt3DCore::QEntity *entity = root->findChild<Qt3DCore::QEntity *>(name);
    if (entity) {
#if (QT_VERSION >= QT_VERSION_CHECK(5, 7, 0))
        QVector<Qt3DCore::QComponent *> components = entity->components();
#else
        Qt3DCore::QComponentList components = entity->components();
#endif
        foreach (Qt3DCore::QComponent *comp, components) {
            if (qobject_cast<Qt3DRender::QMaterial *>(comp)) {
                entity->removeComponent(comp);
                break;
            }
        }
        entity->addComponent(material);
    }
}

void SceneHelper::addComponents(QStringList &names, Qt3DCore::QEntity *root,
                                Qt3DRender::QMaterial *material)
{
    foreach (QString name, names) {
        Qt3DCore::QEntity *entity = root->findChild<Qt3DCore::QEntity *>(name);
        if (entity) {
#if (QT_VERSION >= QT_VERSION_CHECK(5, 7, 0))
            QVector<Qt3DCore::QComponent *> components = entity->components();
#else
            Qt3DCore::QComponentList components = entity->components();
#endif
            foreach (Qt3DCore::QComponent *comp, components) {
                if (qobject_cast<Qt3DRender::QMaterial *>(comp)) {
                    //qDebug() << "   removing " << comp;
                    entity->removeComponent(comp);
                    break;
                }
            }
            entity->addComponent(material);
        }
    }
}

void SceneHelper::searchCamera(Qt3DRender::QSceneLoader *loader, const QString &name)
{
    QVector<Qt3DCore::QEntity *> entities = loader->entities();

    if (entities.isEmpty())
        return;

    Qt3DCore::QEntity *root = entities[0];
    Qt3DCore::QEntity *entity = root->findChild<Qt3DCore::QEntity *>(name);
    //qDebug() << "Found entity " << entity;
#if (QT_VERSION >= QT_VERSION_CHECK(5, 7, 0))
    QVector<Qt3DCore::QComponent *> components = entity->components();
#else
    Qt3DCore::QComponentList components = entity->components();
#endif
    foreach (Qt3DCore::QComponent *comp, components) {
#if (QT_VERSION >= QT_VERSION_CHECK(5, 7, 0))
        if (qobject_cast<Qt3DRender::QCameraLens *>(comp)) {
            Qt3DRender::QCameraLens *lens = qobject_cast<Qt3DRender::QCameraLens *>(comp);
            Q_UNUSED(lens)
        }
#else
        if (qobject_cast<Qt3DCore::QCameraLens *>(comp)) {
            Qt3DCore::QCameraLens *lens = qobject_cast<Qt3DCore::QCameraLens *>(comp);
        }
#endif

    }
}

void SceneHelper::addComponent(QString &name, Qt3DCore::QEntity *root,
                               Qt3DRender::QMaterial *material)
{

    Qt3DCore::QEntity *entity = root->findChild<Qt3DCore::QEntity *>(name);

    if (entity) {
#if (QT_VERSION >= QT_VERSION_CHECK(5, 7, 0))
        QVector<Qt3DCore::QComponent *> components = entity->components();
#else
        Qt3DCore::QComponentList components = entity->components();
#endif
        foreach (Qt3DCore::QComponent *comp, components) {
            if (qobject_cast<Qt3DRender::QMaterial *>(comp)) {
                entity->removeComponent(comp);
                break;
            }
        }

        entity->addComponent(material);
    } else {

    }
}

void SceneHelper::addListEntry(const QVariant &list, QObject *entry)
{
    QQmlListReference ref = list.value<QQmlListReference>();
    ref.append(entry);
}
