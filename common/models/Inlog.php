<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "inlog".
 *
 * @property int $id
 * @property int|null $outbound_id
 * @property int|null $old_status
 * @property int|null $new_status
 * @property string|null $message
 * @property string|null $created_at
 * @property string|null $updated_at
 *
 * @property Inbound $outbound
 */
class Inlog extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ac_iosys.inlog';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['outbound_id', 'old_status', 'new_status'], 'default', 'value' => null],
            [['outbound_id', 'old_status', 'new_status'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['outbound_id'], 'exist', 'skipOnError' => true, 'targetClass' => Inbound::class, 'targetAttribute' => ['outbound_id' => 'ID']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'outbound_id' => 'Outbound ID',
            'old_status' => 'Old Status',
            'new_status' => 'New Status',
            'message' => 'Message',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * Gets query for [[Outbound]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOutbound()
    {
        return $this->hasOne(Inbound::class, ['ID' => 'outbound_id']);
    }
}
