<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "email_template".
 *
 * @property int $id
 * @property string $subject
 * @property string $body
 */
class EmailTemplate extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */

    public static function tableName()
    {
        return 'ac_iosys.email_template';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['subject', 'body'], 'required'],
            [['body'], 'string'],
            [['subject'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'subject' => 'Subject',
            'body' => 'Body',
        ];
    }
    public function replacePlaceholders($recipientName)
    {
        $body = str_replace('{recipientName}', $recipientName, $this->body);
        // Add more replacements as needed
        return $body;
    }
}
