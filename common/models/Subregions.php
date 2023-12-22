<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "subregions".
 *
 * @property int $id
 * @property string $name
 * @property string|null $translations
 * @property int $region_id
 * @property string|null $created_at
 * @property string $updated_at
 * @property int $flag
 * @property string|null $wikidataid
 *
 * @property Countries[] $countries
 * @property Regions $region
 */
class Subregions extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'subregions';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'region_id'], 'required'],
            [['translations'], 'string'],
            [['region_id', 'flag'], 'default', 'value' => null],
            [['region_id', 'flag'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['name'], 'string', 'max' => 100],
            [['wikidataid'], 'string', 'max' => 255],
            [['region_id'], 'exist', 'skipOnError' => true, 'targetClass' => Regions::class, 'targetAttribute' => ['region_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'translations' => 'Translations',
            'region_id' => 'Region ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'flag' => 'Flag',
            'wikidataid' => 'Wikidataid',
        ];
    }

    /**
     * Gets query for [[Countries]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCountries()
    {
        return $this->hasMany(Countries::class, ['subregion_id' => 'id']);
    }

    /**
     * Gets query for [[Region]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRegion()
    {
        return $this->hasOne(Regions::class, ['id' => 'region_id']);
    }
}
