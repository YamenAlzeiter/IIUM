<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "regions".
 *
 * @property int $id
 * @property string $name
 * @property string|null $translations
 * @property string|null $created_at
 * @property string $updated_at
 * @property int $flag
 * @property string|null $wikidataid
 *
 * @property Countries[] $countries
 * @property Subregions[] $subregions
 */
class Regions extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'regions';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['translations'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['flag'], 'default', 'value' => null],
            [['flag'], 'integer'],
            [['name'], 'string', 'max' => 100],
            [['wikidataid'], 'string', 'max' => 255],
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
        return $this->hasMany(Countries::class, ['region_id' => 'id']);
    }

    /**
     * Gets query for [[Subregions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSubregions()
    {
        return $this->hasMany(Subregions::class, ['region_id' => 'id']);
    }
}
