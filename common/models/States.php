<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "states".
 *
 * @property int $id
 * @property string $name
 * @property int $country_id
 * @property string $country_code
 * @property string|null $fips_code
 * @property string|null $iso2
 * @property string|null $type
 * @property float|null $latitude
 * @property float|null $longitude
 * @property string|null $created_at
 * @property string $updated_at
 * @property int $flag
 * @property string|null $wikidataid
 *
 * @property Countries $country
 */
class States extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ac_iosys.states';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'country_id', 'country_code'], 'required'],
            [['country_id', 'flag'], 'default', 'value' => null],
            [['country_id', 'flag'], 'integer'],
            [['latitude', 'longitude'], 'number'],
            [['created_at', 'updated_at'], 'safe'],
            [['name', 'fips_code', 'iso2', 'wikidataid'], 'string', 'max' => 255],
            [['country_code'], 'string', 'max' => 2],
            [['type'], 'string', 'max' => 191],
            [['country_id'], 'exist', 'skipOnError' => true, 'targetClass' => Countries::class, 'targetAttribute' => ['country_id' => 'id']],
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
            'country_id' => 'Country ID',
            'country_code' => 'Country Code',
            'fips_code' => 'Fips Code',
            'iso2' => 'Iso2',
            'type' => 'Type',
            'latitude' => 'Latitude',
            'longitude' => 'Longitude',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'flag' => 'Flag',
            'wikidataid' => 'Wikidataid',
        ];
    }

    /**
     * Gets query for [[Country]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCountry()
    {
        return $this->hasOne(Countries::class, ['id' => 'country_id']);
    }
}
