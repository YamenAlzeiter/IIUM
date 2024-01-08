<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "log".
 *
 * @property int $id
 * @property int|null $outbound_id
 * @property int|null $old_status
 * @property int|null $new_status
 * @property string|null $message
 * @property string|null $created_at
 * @property string|null $updated_at
 *
 * @property Outbound $outbound
 */
class Log extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'log';
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
            [['outbound_id'], 'exist', 'skipOnError' => true, 'targetClass' => Outbound::class, 'targetAttribute' => ['outbound_id' => 'ID']],
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
        return $this->hasOne(Outbound::class, ['ID' => 'outbound_id']);
    }
}
