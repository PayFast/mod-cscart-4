<div class="control-group">
    <label class='control-label' for="merchant_id">{__("merchant_id")}:</label>
    <div class="controls">
        <input type="text" name="payment_data[processor_params][merchant_id]" id="merchant_id" value="{$processor_params.merchant_id}" class="input-text" />
        <input type='hidden' name='payment_data[processor_params][currency]' id='currency' value='ZAR'>
    </div>
</div>
<div class="control-group">
    <label class='control-label' for="merchant_key">{__("merchant_key")}:</label>
    <div class="controls">
        <input type="text" name="payment_data[processor_params][merchant_key]" id="merchant_key" value="{$processor_params.merchant_key}" class="input-text" />
    </div>
</div>

<div class="control-group">
    <label class='control-label' for="mode">{__("text_payfast_sandbox_live")}:</label>
    <div class="controls">
        <select name="payment_data[processor_params][mode]" id="mode">
            <option value="sandbox" {if $processor_params.mode == "sandbox"}selected="selected"{/if}>{__("sandbox")}</option>
            <option value="live" {if $processor_params.mode == "live"}selected="selected"{/if}>{__("live")}</option>
        </select>
    </div>
</div>
<div class="control-group">
    <label class='control-label' for="debug">{__("text_debug")}:</label>
    <div class="controls">
        <select name="payment_data[processor_params][debug]" id="debug">
            <option value="1" {if $processor_params.debug}selected="selected"{/if}>{__("true")}</option>
            <option value="0" {if !$processor_params.debug}selected="selected"{/if}>{__("false")}</option>
        </select>
    </div>
</div>
<div class="control-group">
    <label class='control-label' for="passphrase">{__("passphrase")}:</label>
    <div class="controls">
        <input type="text" name="payment_data[processor_params][passphrase]" id="passphrase" value="{$processor_params.passphrase}" class="input-text" />
    </div>
</div>

{include file="common/subheader.tpl" title=__("text_payfast_status_map") target="#text_payfast_status_map"}


{assign var="statuses" value=$smarty.const.STATUSES_ORDER|fn_get_simple_statuses}
<div id='text_payfast_status_map'>
    <div class="control-group">
        <label class='control-label' for="payfast_completed">{__("completed")}:</label>
        <div class="controls">
            <select name="payment_data[processor_params][statuses][completed]" id="payfast_completed">
                {foreach from=$statuses item="s" key="k"}
                <option value="{$k}" {if (isset($processor_params.statuses.completed) && $processor_params.statuses.completed == $k) || (!isset($processor_params.statuses.completed) && $k == 'P')}selected="selected"{/if}>{$s}</option>
                {/foreach}
            </select>
        </div>    
    </div>

    <div class="control-group">
        <label class='control-label' for="payfast_failed">{__("failed")}:</label>
        <div class="controls">
            <select name="payment_data[processor_params][statuses][failed]" id="payfast_failed">
                {foreach from=$statuses item="s" key="k"}
                <option value="{$k}" {if (isset($processor_params.statuses.failed) && $processor_params.statuses.failed == $k) || (!isset($processor_params.statuses.failed) && $k == 'F')}selected="selected"{/if}>{$s}</option>
                {/foreach}
            </select>
        </div>
    </div>
</div>
